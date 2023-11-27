import subprocess
import os
import json


terraform_path = "/mnt/d/Terraform-Deployments/Azure/App_Server"

# Change to the directory where your .tf files are located
os.chdir(terraform_path)

def init():
    # Run "terraform init"
    init = subprocess.run(["terraform.exe", "init"], capture_output=True, text=True)
    if init.returncode != 0:
        print(f"'terraform init' failed: {init.stderr}")
        exit(1)
    else:
        print(f"'terraform init' output: {init.stdout}")

def plan():
    # Run "terraform plan"
    plan = subprocess.run(["terraform.exe", "plan"], capture_output=True, text=True)
    if plan.returncode != 0:
        print(f"'terraform plan' failed: {plan.stderr}")
        exit(1)
    else:
        print(f"'terraform plan' output: {plan.stdout}")

def apply():
    # Run "terraform apply -auto-approve"
    apply = subprocess.run(["terraform.exe", "apply", "-auto-approve"], capture_output=True, text=True)
    if apply.returncode != 0:
        print(f"'terraform apply' failed: {apply.stderr}")
        exit(1)
    else:
        print(f"'terraform apply' output: {apply.stdout}")

def destroy():
    # Run "terraform apply -auto-approve"
    apply = subprocess.run(["terraform.exe", "destroy", "-auto-approve"], capture_output=True, text=True)
    if apply.returncode != 0:
        print(f"'terraform destroy' failed: {apply.stderr}")
        exit(1)
    else:
        print(f"'terraform destroy' output: {apply.stdout}")

def output():
    # Run 'terraform output'
    output = subprocess.run(["terraform.exe", "output", "-json"], capture_output=True, text=True)
    if output.returncode != 0:
        print(f"'terraform output' failed: {output.stderr}")
        exit(1)
    else:

        # Parse the JSON output
        outputs = json.loads(output.stdout)

        # Now 'outputs' is a dict with your Terraform outputs
        for name, details in outputs.items():
            print(f"Output '{name}': {details['value']}")

        return outputs

plan()
apply()
output()
# destroy()