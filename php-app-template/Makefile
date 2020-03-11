up:
	docker-compose up -d php-fpm nginx

php-cli:
	docker-compose run --rm php-cli sh

php-cli-root:
	docker-compose run --rm php-cli-root sh

install-symfony-skeleton-4.4:
	docker-compose run --rm php-cli-root composer create-project symfony/skeleton:^4.4 app
install-symfony-website-skeleton-4.4:
	docker-compose run --rm php-cli-root composer create-project symfony/website-skeleton:^4.4 app
install-laravel:
	docker-compose run --rm php-cli-root composer create-project --prefer-dist laravel/laravel app

composer-install-php-cs-fixer:
	docker-compose run --rm php-cli composer require --dev friendsofphp/php-cs-fixer
composer-install-phpstan:
	docker-compose run --rm php-cli composer require --dev phpstan/phpstan
composer-install-security-advisories:
	docker-compose run --rm php-cli composer require --dev roave/security-advisories

cs-check:
	docker-compose run --rm php-cli php-cs-fixer -v fix --config=.php_cs --dry-run --diff
cs-fix:
	docker-compose run --rm php-cli php-cs-fixer -v fix --config=.php_cs --diff

composer-phpstan:
	docker-compose run --rm php-cli composer phpstan

composer-install:
	docker-compose run -e GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" --rm php-cli composer install
