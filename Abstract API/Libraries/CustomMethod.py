import json
from genson import SchemaBuilder


#
# def Genarate_schema():
#
#     builder = SchemaBuilder()
#     with open("../Abstract API/JSON files/response.json", 'r') as f:
#         datastore = json.load(f)
#         builder.add_object(datastore)
#     builder.to_schema()
#     return builder.to_schema()

LOGIN_BODY = {"name":
            "prem",
              }
def Check_File_Type(file):
    converted_file = str(file)
    print(converted_file)
    print(type(converted_file))
    if ".txt" in converted_file:
        return 1
    else:
        return 0


