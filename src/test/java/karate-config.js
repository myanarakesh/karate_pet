function fn() {
	var env = karate.env;
	karate.log('karate.env system property was:', env);
	if (!env) {
		env = 'dev';
	}
	var config = {
		baseUrl : 'https://petstore.swagger.io/'
	};
	if (env == 'stage') {
		config.baseUrl = 'https://stage.petstore.swagger.io/';
	} else if (env == 'qa') {
		config.baseUrl = 'https://petstore.swagger.io/';
	}
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	return config;
}