# post-bankru - Описание RU

## Автоматическая публикация Официального курса валют и банковских металлов по данным Центрального Банка России  

Данные берутся из локальной базы данных mysql, обновляемой регулярно  [БД ЦБР](https://github.com/dsunegin/bankru) 

В файле **.env** задается конфигурация. Переименуйте файл **.env.example** -> **.env**  и задайте свои значения.
 
# post-bankru - Description EN

## AUTO POSTING of official exchange rate of Rub (RUB) currency according to the Central Bank of Russian Federation

FX Data from local database `finance` [DB_CBR](https://github.com/dsunegin/bankru) is generating a POST with nunjucks template and stores to a database `press`  

#### Clone & Install Dependencies
```bash
git clone https://github.com/dsunegin/post-bankru
cd post-bankru
npm install
```

Configure your env:
```
cp .env.example .env

```

In order to override sample `post-bankru` settings such as `DB_FINHOST, DB_FINUSER, DB_FINDATABASE, DB_FINPASSWORD, ....`  endpoints, create/copy an `.env` file in the `post-bankru` root directory, and declare any environment overrides you need in that file

A short explanation of a `.env` file:

```
DB_FINHOST: localhost               - mysql Host
DB_FINPORT: 3306                    - mysql Port
DB_FINUSER:  finance_user           - mysql User 
DB_FINDATABASE: finance             - Database with FX rates
DB_FINPASSWORD: psw_finance_user    - UserPassword 

DB_PRESSHOST="localhost"            - mysql Host
DB_PRESSPORT=3306                   - mysql Port
DB_PRESSUSER="press_user"           - mysql User
DB_PRESSDATABASE="press"            - Database with POSTS
DB_PRESSPASSWORD="psw_press_user"   - UserPassword 


PATH_TEMPLATES = './templates'      - template path
WEBSITE_ROOT_PATH = "/var/www/html-website"                                 - website root path
PERSON_PATH_PATH = "/var/www/html-website/images/www/person"         - absolute path to random directory
PERSON = "bolie|bolie-others|georgy-bolie-red|georgy-bolie-s"        - list of random DIR 

```

## Running `post-bankru`

Either configure `post-bankru` to run by pm2 (node process manager)  with cron or manually start the `bankru` process.

To manually start `post-bankru` once it is installed:

```bash
node post-bankru.js 
```

### Start the pm2 cron for Today rates

```bash
./pm2-post-bankru.sh
```
By default, cron runs every day at 8:00 a.m. 

You can adjust it in  `pm2-post-bankru.sh` file.
 
**Notice:** You must have installed pm2 process manager to run pm2-post-bankru.sh script.


## Contact
Denis Sunegin `dsunegin@gmail.com`
