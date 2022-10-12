from distutils.log import error
import boto3
import time, urllib.request, urllib.parse, urllib.error
import json

print ("*"*80)
print ("Initializing..")
print ("*"*80)



dynamodb = boto3.resource('dynamodb')
s3 = boto3.client('s3')

def lambda_handler(event, context):
    # TODO implement
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    object_key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'])
    # source_bucket = "sourcebucket-karimomar"
    # object_key = "code.PNG"
    target_bucket = 'targetbucket-karimsoliman'
    copy_source = {'Bucket': source_bucket, 'Key': object_key}
    
  
    print ("Source bucket : ", source_bucket)
    print ("Target bucket : ", target_bucket)
    print ("Log Stream name: ", context.log_stream_name)
    print ("Log Group name: ", context.log_group_name)
    print ("Request ID: ", context.aws_request_id)
    print ("Mem. limits(MB): ", context.memory_limit_in_mb)
    try:
        print ("Using waiter to waiting for object to persist through s3 service")
        waiter = s3.get_waiter('object_exists')
        waiter.wait(Bucket=source_bucket, Key=object_key)
        s3.copy_object(Bucket=target_bucket, Key=object_key, CopySource=copy_source)
        
        table = dynamodb.Table('filelist')
        #Create a list of all the existing files
        id=table.scan()['Items']
        num=len(id)+1
        response = table.put_item(
        Item={
            'id':num,
            "name":object_key,
             }
        )
        
        print (id)
        return response['ContentType']
    except Exception as err:
        print ("Error -"+str(err))
        return err


Error -An error occurred (ValidationException) when calling the PutItem operation: One or more parameter values were invalid: Type mismatch for key id expected: S actual: N
[ERROR] Runtime.MarshalError: Unable to marshal response: Object of type ClientError is not JSON serializable
Traceback (most recent call last):END RequestId: 7a48591b-0787-4fe2-b5fb-80627605f473
REPORT RequestId: 7a48591b-0787-4fe2-b5fb-80627605f473	Duration: 395.91 ms	Billed Duration: 396 ms	Memory Size: 128 MB	Max Memory Used: 77 MB
