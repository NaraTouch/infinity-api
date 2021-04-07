<?php
namespace App\Controller;
use App\Controller\AppController;

class PCloudsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('PCloud');
		$this->loadComponent('Response');
		$this->loadComponent('Validation');
	}

	public function index()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateListDirectory((array) $request_body);
			if (empty($validate)) {
				if ($request_body) {
					$path = $request_body->path;
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

	public function createFolderIfNotExists()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateCreateFolderIfNotExists((array) $request_body);
			if (empty($validate)) {
				$request = [
					'path' => $request_body->path,
					'folder_id' => $request_body->folder_id,
					'name' => $request_body->name,
				];
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
			} else {
				$http_code = 400;
				$message = 'Create Folder Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
		}
	}

	public function renameFolder()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateRenameFolder((array) $request_body);
			if (empty($validate)) {
				$request = [
					'folder_id' => $request_body->folder_id,
					'name' => $request_body->name,
				];
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
			} else {
				$http_code = 400;
				$message = 'Rename Folder Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
			
		}
	}

	public function deleteFolder()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateDeleteFolder((array) $request_body);
			if (empty($validate)) {
				$request = [
					'folder_id' => $request_body->folder_id,
					'path' => $request_body->path,
				];
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
			} else {
				$http_code = 400;
				$message = 'Delete Folder Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
			
		}
	}

	public function renameFile()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$validate = $this->Validation->validateRenameFile((array) $request_body);
			if (empty($validate)) {
				$request = [
						'file_id' => $request_body->file_id,
						'name' => $request_body->name,
					];
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
			} else {
				$http_code = 400;
				$message = 'Rename File Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
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
			$file['file'] = [];
			$request_body = $this->request->getQuery();
			if ($this->request->getData()) {
				$file['file'] = $this->request->getData('file');
			}
			$data = $request_body;
			$data['file'] = $file['file'];
			$validate = $this->Validation->validateUploadFile($data);
			if (empty($validate)) {
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
			} else {
				$http_code = 201;
				$message = 'Upload Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
			
		}
	}
}
