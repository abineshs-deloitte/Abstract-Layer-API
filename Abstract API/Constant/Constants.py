BASEURL="https://api-nodejs-todolist.herokuapp.com"
BASEURL2="https://89017a91-5de9-41be-8be9-0281f4a108c8.mock.pstmn.io"

Get_Method="GET"
Post_Method="POST"
Put_Method="PUT"
Delete_Method="DELETE"

json_header="application/json"
text_header="text/plain"

# form_header="multipart/form-data; boundary=<calculated when request is sent>"
file_upload_Endpoint="/user/me/avatar"
user_endpoint="/task"
login_endpoint="/user/login"
update_profile_endpoint="/user/me"
Delete_Endpoint="/user/me"
text_endpoint="/2"

success_status_code=200

query_parameter="limit=1&skip=1"

user_schema="../AbstractLayer/Testdatas/Api/Schemas/user_data.json"
login_schema="../AbstractLayer/Testdatas/Api/Schemas/login_schema.json"
update_profile_schema="../AbstractLayer/Testdatas/Api/Schemas/update_profile.json"
delete_schema="../AbstractLayer/Testdatas/Api/Schemas/delete_user.json"


success_status_message="OK"

text_content_type="text/html; charset=utf-8"

image_path="../AbstractLayer/Testdatas/Api/files/harsha-p.jpg"
text_path="../AbstractLayer/Testdatas/Api/files/admin.txt"

file_type_data="data"
file_type_files="files"

file_token="public_kW15awsBjhB3CBQWdQxXzu1a3GnP"
File_api="https://api.upload.io/v2/accounts/"
file_Endpoint="kW15aws/uploads/binary"