# SepSSL

基于 Lego 的自动化获取 Aliyun 的 SSL 证书脚本，可以快速方便的申请域名证书。

# 使用方法

1. 克隆项目到本地：
```
git clone git@github.com:SeaYJ/AliyunSSL.git
```
或
```
git clone https://github.com/SeaYJ/AliyunSSL.git
```
2. 将 **config.template.ini** 文件更名为 **config.ini**。
3. 按照下面的[**配置说明**](#配置说明)修改配置信息。
4. 以管理员身份运行脚本。

# 配置说明

|键|值|说明|
|:--|:--|:--|
|`ALICLOUD_ACCESS_KEY`|template_alicloud_access_key|阿里云账户的访问密钥，用于身份验证和 API 请求。请确保该密钥具有足够的权限来执行所需的操作。|
|`ALICLOUD_SECRET_KEY`|template_alicloud_secret_key|阿里云账户的安全密钥，与访问密钥配对使用，以确保安全访问。|
|`EMAIL`|template_your_email|用于证书申请的电子邮件地址，建议使用常用邮箱，以便接收相关通知。|
|`DOMAIN1`|template.com|（可调整）主要域名，申请证书时需要指定的域名。请替换为您的实际域名。|
|`DOMAIN2`|*.template.com|（可选）通配符域名，允许您为该域名下的所有子域名申请证书。例如，*.example.com 将覆盖 www.example.com 和 api.example.com。|
|`LEGO_DNS_RESOLVERS`|dns0.template.com,dns1.template.com|用于 DNS 验证的 DNS 服务器地址，确保使用的 DNS 服务器支持 ACME DNS-01 挑战。请替换为您实际使用的 DNS 服务器地址。</br>可以写一个，也可以写多个；可以写 DNS 服务器的 **ip 地址**，也可以写 DNS 服务器的**域名地址**。|

# 其他说明

生成的 SSL 证书文件存放在 [ssl/certificates](ssl/certificates)，其中后缀为 **.crt** 的文件即为你的**域名证书**，**.issuer.crt** 文件为**中间证书**（或称为**颁发者证书**），**.key** 文件为**域名私钥**。

具体可见下表：

|**文件后缀**|**说明**|
|:--|:--|
|`.crt`|域名证书|
|`.issuer.crt`|中间证书/颁发者证书|
|`.key`|域名私钥|