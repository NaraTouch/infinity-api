<?php
namespace App\Controller;
use App\Controller\AppController;

class PCloudsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadModel('Pclouds');
		$this->loadComponent('PCloud');
		$this->loadComponent('Response');
		$this->loadComponent('Validation');
	}

	public function accounts()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$condition = [];
			if (!empty($data)) {
				if (!empty($data['website_id'])) {
					$condition['Pclouds.website_id'] = $data['website_id'];
				}
			}
			$query = $this->Pclouds->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Websites', function($website) use ($filter) {
						return $website
							->where([
								'Websites.id' => $filter['website_id'],
							]);
					})
					->contain(['Websites']);
			} else {
				$query
					->contain(['Websites'])
					->where($condition);
			}
			$data = [];
			if ($query) {
				$data = $query;
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $data);
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$p_cloud = $this->Pclouds->newEntity();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			$entity = $this->Pclouds->patchEntity($p_cloud, $data);
			if ($this->Pclouds->save($entity)) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message);
			} else {
				$http_code = 400;
				$message = 'Add not success';
				return $this->Response->Response($http_code, $message, null, $entity->errors());
			}
		}
	}

	public function edit()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$p_cloud = $this->Pclouds->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			$entity = $this->Pclouds->patchEntity($p_cloud, $data);
			if ($this->Pclouds->save($entity)) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message);
			} else {
				$http_code = 400;
				$message = 'Edit not success';
				return $this->Response->Response($http_code, $message, null, $entity->errors());
			}
		}
	}

	public function view()
	{
		if ($this->request->is('post')) {
			$condition = [];
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($data)) {
				if (!empty($data['id'])) {
					$condition['Pclouds.id'] = $data['id'];
				}
			}
			if (!empty($filter)) {
				$condition['Pclouds.website_id'] = $filter['website_id'];
			}
			$query = $this->Pclouds->find()
						->where($condition)
						->first();
			if ($query) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $query);
			} else {
				$http_code = 404;
				$message = 'Account not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
	}

	public function index()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateListDirectory((array) $request_body);
			if (empty($validate)) {
				if ($request_body) {
					$path = $request_body->path;
					$website_id = $request_body->website_id;
					$filter = $this->Response->getFilterByWebsite($auth['group_id']);
					if (!empty($filter)) {
						if ($filter['website_id'] == $website_id) {
							return $this->listDirectory($path);
						} else {
							$http_code = 403;
							$message = 'Unauthorized';
							return $this->Response->Response($http_code, $message, null, null);
						}
					} else {
						return $this->listDirectory($path);
					}
				} else {
					$http_code = 404;
					$message = 'User not found.';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				$http_code = 400;
				$message = 'Listing Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
		}
	}
	
	public function listDirectory($path = null)
	{
		$dir = $this->PCloud->listDirectory($path);
		if ($dir) {
			if ($dir['result'] === 0) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $dir);
			} else {
				$http_code = $dir['result'];
				$message = $dir['error'];
				return $this->Response->PcloudMessage($http_code, $message);
			}
		} else {
			$http_code = 500;
			$message = 'Internal Server Error';
			return $this->Response->Response($http_code, $message);
		}
	}

	public function createFolderIfNotExists()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateCreateFolderIfNotExists((array) $request_body);
			if (empty($validate)) {
				$request = [
					'path' => $request_body->path,
					'folder_id' => $request_body->folder_id,
					'name' => $request_body->name,
				];
				$website_id = $request_body->website_id;
				$filter = $this->Response->getFilterByWebsite($auth['group_id']);
				if (!empty($filter)) {
					if ($filter['website_id'] == $website_id) {
						return $this->createFolder($request);
					} else {
						$http_code = 403;
						$message = 'Unauthorized';
						return $this->Response->Response($http_code, $message, null, null);
					}
				} else {
					return $this->createFolder($request);
				}
			} else {
				$http_code = 400;
				$message = 'Create Folder Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
		}
	}

	public function createFolder($request = null)
	{
		$response = $this->PCloud->createFolderIfNotExists($request);
		if ($response) {
				if ($response['result'] === 0) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message, $response);
				} else {
					$http_code = $response['result'];
					$message = $response['error'];
					return $this->Response->PcloudMessage($http_code, $message);
				}
		} else {
			$http_code = 500;
			$message = 'Internal Server Error';
			return $this->Response->Response($http_code, $message);
		}
	}

	public function renameFolder()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateRenameFolder((array) $request_body);
			if (empty($validate)) {
				$request = [
					'folder_id' => $request_body->folder_id,
					'name' => $request_body->name,
				];
				$website_id = $request_body->website_id;
				$filter = $this->Response->getFilterByWebsite($auth['group_id']);
				if (!empty($filter)) {
					if ($filter['website_id'] == $website_id) {
						return $this->editFolder($request);
					} else {
						$http_code = 403;
						$message = 'Unauthorized';
						return $this->Response->Response($http_code, $message, null, null);
					}
				} else {
					return $this->editFolder($request);
				}
			} else {
				$http_code = 400;
				$message = 'Rename Folder Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
			
		}
	}

	public function editFolder($request = null)
	{
		$response = $this->PCloud->renameFolder($request);
		if ($response) {
			if ($response['result'] === 0) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $response);
			} else {
				$http_code = $response['result'];
				$message = $response['error'];
				return $this->Response->PcloudMessage($http_code, $message);
			}
		} else {
			$http_code = 500;
			$message = 'Internal Server Error';
			return $this->Response->Response($http_code, $message);
		}
	}

	public function deleteFolder()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateDeleteFolder((array) $request_body);
			if (empty($validate)) {
				$request = [
					'folder_id' => $request_body->folder_id,
					'path' => $request_body->path,
				];
				$website_id = $request_body->website_id;
				$filter = $this->Response->getFilterByWebsite($auth['group_id']);
				if (!empty($filter)) {
					if ($filter['website_id'] == $website_id) {
						return $this->removeFolder($request);
					} else {
						$http_code = 403;
						$message = 'Unauthorized';
						return $this->Response->Response($http_code, $message, null, null);
					}
				} else {
					return $this->removeFolder($request);
				}
			} else {
				$http_code = 400;
				$message = 'Delete Folder Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
			
		}
	}

	public function removeFolder($request = null)
	{
		$response = $this->PCloud->deleteFolder($request);
		if ($response) {
			if ($response['result'] === 0) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $response);
			} else {
				$http_code = $response['result'];
				$message = $response['error'];
				return $this->Response->PcloudMessage($http_code, $message);
			}
		} else {
			$http_code = 500;
			$message = 'Internal Server Error';
			return $this->Response->Response($http_code, $message);
		}
	}

	public function renameFile()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateRenameFile((array) $request_body);
			if (empty($validate)) {
				$request = [
						'file_id' => $request_body->file_id,
						'name' => $request_body->name,
					];
				$website_id = $request_body->website_id;
				$filter = $this->Response->getFilterByWebsite($auth['group_id']);
				if (!empty($filter)) {
					if ($filter['website_id'] == $website_id) {
						return $this->editFile($request);
					} else {
						$http_code = 403;
						$message = 'Unauthorized';
						return $this->Response->Response($http_code, $message, null, null);
					}
				} else {
					return $this->editFile($request);
				}
			} else {
				$http_code = 400;
				$message = 'Rename File Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
		}
	}

	public function editFile()
	{
		$response = $this->PCloud->renameFile($request);
		if ($response) {
			if ($response['result'] === 0) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $response);
			} else {
				$http_code = $response['result'];
				$message = $response['error'];
				return $this->Response->PcloudMessage($http_code, $message);
			}
		} else {
			$http_code = 500;
			$message = 'Internal Server Error';
			return $this->Response->Response($http_code, $message);
		}
	}
	
	public function deleteFile()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateDeleteFile((array) $request_body);
			if (empty($validate)) {
				$request = [
					'file_id' => $request_body->file_id,
					'path' => $request_body->path,
				];
				$response = $this->PCloud->deleteFile($request);
				if ($response) {
					if ($response['result'] === 0) {
						$http_code = 200;
						$message = 'Success';
						return $this->Response->Response($http_code, $message, $response);
					} else {
						$http_code = $response['result'];
						$message = $response['error'];
						return $this->Response->PcloudMessage($http_code, $message);
					}
				} else {
					$http_code = 500;
					$message = 'Internal Server Error';
					return $this->Response->Response($http_code, $message);
				}
			} else {
				$http_code = 400;
				$message = 'Delete File Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
		}
	}
	
	public function uploadFileProgress()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateUploadFileProgress((array) $request_body);
			if (empty($validate)) {
				$request = [
					'progresshash' => $request_body->progresshash,
				];
				$response = $this->PCloud->uploadFileProgress($request);
				if ($response) {
					if ($response['result'] === 0) {
						$http_code = 200;
						$message = 'Success';
						return $this->Response->Response($http_code, $message, $response);
					} else {
						$http_code = $response['result'];
						$message = $response['error'];
						return $this->Response->PcloudMessage($http_code, $message);
					}
				} else {
					$http_code = 500;
					$message = 'Internal Server Error';
					return $this->Response->Response($http_code, $message);
				}
			} else {
				$http_code = 400;
				$message = 'Get Upload Progress Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
		}
	}

	public function uploadFile()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$file['file'] = [];
			$request_body = $this->request->getQuery();
			if ($this->request->getData()) {
				$file['file'] = $this->request->getData('file');
			}
			$data = $request_body;
			$data['file'] = $file['file'];
			$validate = $this->Validation->validateUploadFile($data);
			if (empty($validate)) {
				$website_id = $request_body['website_id'];
				$filter = $this->Response->getFilterByWebsite($auth['group_id']);
				if (!empty($filter)) {
					if ($filter['website_id'] == $website_id) {
						return $this->uploadingFile($request_body, $file);
					} else {
						$http_code = 403;
						$message = 'Unauthorized';
						return $this->Response->Response($http_code, $message, null, null);
					}
				} else {
					return $this->uploadingFile($request_body, $file);
				}
			} else {
				$http_code = 201;
				$message = 'Upload Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
			
		}
	}
	
	public function uploadingFile($request_body = null, $file)
	{
		$response = $this->PCloud->uploadFile($request_body, $file);
		if ($response) {
			if ($response['result'] === 0) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $response);
			} else {
				$http_code = $response['result'];
				$message = $response['error'];
				return $this->Response->PcloudMessage($http_code, $message);
			}
		} else {
			$http_code = 500;
			$message = 'Internal Server Error';
			return $this->Response->Response($http_code, $message);
		}
	}
}
