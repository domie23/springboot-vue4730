package com.demo.movie.config.home;



public class AlipayConfig {
	
//?????????????????????????????????????

	// ??ID,??APPID?????????APPID???????
	public static String app_id = "2016101600701680";
	
	// ???????PKCS8??RSA2??
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCHVS8jZuYoPOIbx4BvFUdFcAZ6glxzXFoS3o8A+vkgGejaZDnfni5p61X78wLzw2QyyJuIrJ/GNfW5q53n4BznMe8aPHcufBtgFBgjT4wJi94EzvCN5KbsuSnXjlfp9b3inKOGbkZbP+Rafw66MEFmFrCFav2XSETkQg3AxG8aCL18ANM5wr96NEev9XtQoHFXC9bcbpRmlpWrBYIElqhD94ngQU/UyUsMLc5+iF1vjjs46E4C6r1cBSp0KoEZMniw0ccS05LbBSIzJRNYEd4UktRZwrC+m+kkkezt4WQBUSEEdxd/xC1O5k3DPxLgxkOOAH3JfNTSUX38fbyfJi6DAgMBAAECggEBAIMy2xsYE8Momw/RTjrixxCTNUSpgtU3z/8BEmQh60jqtWqbxdt7b4Wx58703YTShR4Si25p5A91mn5g2RnFlF+ychneSrCfEq8HbAs3gAx1M004Dc+Rvx45uE3IKoSff3Hk50dZOw4Vl9z/1pg8VfqRvpnpimWSY29idhDOnuL95KV7bjAfAkBKHHP9WgDyxbiIi2elveD4TNIFqojv9VaZzQOlrevFKc0DtK6qYnh0UVVxjitlResSbp7vWMDJUX1QFDGtlcA9Wi1LqzYXfA6iNWk3qOstkFGygZiX7jleaBVtsIziy5iv/IWL0PRcxM7XjuOUhdJxKhZExLX6rgkCgYEA9zbS1YWsMK8P4pzhAPyJ8kt7xhD8E975/lDXJvTd+UQgtNth89DpIhARLxKUcHb60S/GEPbtoJDxm24vXYuLiCfwChbI+VpvJvvI8bYnMOB0DI+ZqS52/6MU32lFf5LVCTNPJ70eoO6oq+AF5mTERqpYScf9u7fz3QtSlSJ8EVcCgYEAjCR0HSRFOS2j7zvjp7eQQyYVFp3CPDsL8vsQZVNYxxWJSUYeqkUY37Yzq+H7bHEZsdaccaQi6vti0NYIY23L3u2hq7MuUDoCN9JuYs+eM0kKBoQGw5gIFKZ2Od0iUE5gfqUQhsynbI4H9zKBiqPJL7x8qvxafIePJG6DCGbx9LUCgYEAkGO/BOOMTOsS9iL28GKQF6qq4matNNX5YebJo4FF3P9Dsx6nuYZ9hF2qC7poZL+5g1DJ+MKgzDWcSFI07AhDOQVKmDnyrGF7pmNNXJAtl8ihP2zoLP5slqcj29FavEaAk10akHVPXGPItIqmJ4kXcsavxng+5NNuZd7lHyIDIQUCgYA0y1LW26AcXz4/1M75kuSM917Aa2QN7qyct8pAcbqjHVDfwsOwn2E0fd5PZU2jV6Q3Y8MB6LSi01sxk0ALvQQtklXyagkLfh7xypt9K/vMFDrro3cs3ixFI0Ssncrcd/pQG3zzW0vDUGpdzLASe4tCKX7Jp1GrUiIxtlQ0qRuDdQKBgQDkgyhILVmUhDLoOajbjns8Wft4DxDbEKRO9Bs81LDaeLcnbAZRC8KBd/TxTpMw94brsEfmEUJj0+IAKNMwQRqhJXGvq3kBoPZKhEDYk4xrhavwtBqB9wrsntaB40kODqPfI5cKgXx0S5phVNxLoW0/FThAcZa6ubmo+ibQGpuTGA==";
	
	// ?????,?????https://openhome.alipay.com/platform/keyManage.htm ??APPID????????
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnrXlREef+TfVquFbHthD+Zdplt6I7p2cKfdTRcu1Q5v5BjKClOe0jAM+LczLhxAJ5B5CIgQMCVxtG4xpR0u9Z2aZHnt8imc7Ow++D9VB5vn6v9zPzfn6/j4ZrBR6wyyEo1PfAToJGNJ/FH2PN8pQiC4/5xUfbGAWoFphxlh2rlxgmtTIvvl7r+NGr1I0sH/vg1w5qHqe8gcnBbpJXB/25J+7ZIwKnap0gy5pg6cmJuFAp9H19wv6jNTBt108bectsVDiB/yX9sIoD1km3xgPEYLY3egN99o09Wpa3Lg9MggYKcn3hxKviijxDjg0RPmsI11h5FvLtBIRmcZ/o2wHxQIDAQAB";

	// ???????????  ?http://????????????id=123??????????????????
	public static String notify_url = "";

	// ???????????? ?http://????????????id=123??????????????????
	public static String return_url = "";

	// ????
	public static String sign_type = "RSA2";
	
	// ??????
	public static String charset = "utf-8";
	
	// ?????
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";//https://openapi.alipay.com/gateway.do
    
}