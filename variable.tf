variable "function_name" { 
  type = string 
  description = "name of lambda function"
}

variable "iam_role_name" { 
  type = string 
  description = "iam role name"
}

variable "handler" { 
  type = string 
  description = "handler name"
}

variable "bucket" { 
  type = string 
  description = "name of s3 bucket"
}

variable "region" { 
  type = string 
  description = "aws region to deploy"
}

variable "runtime" { 
  type = string 
  description = "lambda runtime"
}

variable "data_type" { 
  type = string 
  description = "lambda runtime"
}

variable "data_source_file" { 
  type = string 
  description = "lambda runtime"
}

variable "data_output_path" { 
  type = string 
  description = "lambda runtime"
}

variable "statement_id" { 
  type = string 
  description = "allow bucket statement id"
  default = "AllowExecutionFromS3Bucket"
}

variable "action" { 
  type = string 
  description = "allow bucket action"
  default = "lambda:InvokeFunction"
}

variable "principal" { 
  type = string 
  description = "principal"
  default = "s3.amazonaws.com"
}