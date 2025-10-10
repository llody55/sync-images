'''
Author: llody 745719408@qq.com
Date: 2024-06-11 18:07:57
LastEditors: llody 745719408@qq.com
LastEditTime: 2024-08-26 16:00:28
FilePath: \sync-images\.github\workflows\app\sync_images.py
Description: 批量镜像同步脚本
'''
import yaml
import subprocess

# 读取images-to-sync.yml文件
with open("images-to-sync.yml", "r") as stream:
    try:
        images = yaml.safe_load(stream)["images"]
    except yaml.YAMLError as exc:
        print(exc)
        exit(1)

# 定义目标仓库
aliyun_registry = "registry.cn-hangzhou.aliyuncs.com"
huawei_registry = "swr.cn-southwest-2.myhuaweicloud.com"
namespace = "llody"

# 迁移镜像
for image_name, tags in images.items():
    # 提取组织名称和镜像名称
    if '/' in image_name:
        org_name, repo_name = image_name.split('/')
        print("完整组织名称和镜像名称：", org_name, repo_name)
    else:
        org_name = namespace
        repo_name = image_name
        print("拼接组织名称和镜像名称：", org_name, repo_name)
    
    for tag_info in tags:
        tag = tag_info["tag"]
        source_image = f"docker://docker.io/{image_name}:{tag}"
        
        if org_name == namespace:
            aliyun_target_image = f"docker://{aliyun_registry}/{namespace}/{repo_name}:{tag}"
            huawei_target_image = f"docker://{huawei_registry}/{namespace}/{repo_name}:{tag}"
        else:
            # aliyun_target_image = f"docker://{aliyun_registry}/{namespace}/{org_name}-{repo_name}:{tag}"
            # huawei_target_image = f"docker://{huawei_registry}/{namespace}/{org_name}-{repo_name}:{tag}"
            aliyun_target_image = f"docker://{aliyun_registry}/{namespace}/{repo_name}:{tag}"
            huawei_target_image = f"docker://{huawei_registry}/{namespace}/{repo_name}:{tag}"
        
        try:
            print(f"Syncing {source_image} to {aliyun_target_image}")
            subprocess.run(["skopeo", "copy", "--all", "--format", "v2s2", source_image, aliyun_target_image], check=True)
        except subprocess.CalledProcessError as e:
            print(f"Error syncing {source_image} to {aliyun_target_image}: {e}")
            print(f"Output: {e.output}")
            continue
        
        try:
            print(f"Syncing {source_image} to {huawei_target_image}")
            subprocess.run(["skopeo", "copy", "--all", "--format", "v2s2", source_image, huawei_target_image], check=True)
        except subprocess.CalledProcessError as e:
            print(f"Error syncing {source_image} to {huawei_target_image}: {e}")
            print(f"Output: {e.output}")
            continue
