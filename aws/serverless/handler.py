import json

def hello(event, context):

    bodyData = json.dumps({"Status": "Recebido"})
    
    return {
        'statusCode': 200,
        'body': bodyData
    }