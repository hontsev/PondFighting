# “池塘大战”

## 简介

- 本项目为基于Ruby On Rails的“池塘大战”多人脚本对战网站。
- 游戏基于Google的Blockly Games: Pond（“池塘”）游戏。游戏地址：https://blockly-games.appspot.com/pond-duck
- 本项目主要围绕Pond游戏，开发了多人脚本对战的基本功能，实现了用户个人信息管理、个人脚本管理、多种对战的玩法、个人比赛数据统计等功能。
- 演示地址：https://pondfighting-hontsev.c9users.io

## 说明

目前使用的库和数据库：

* 使用[Bootstrap](http://getbootstrap.com/)作为前端库
* 使用[AdminTLE](https://adminlte.io/)作为前端界面模板
* 使用[SQLite](http://www.sqlite.org/)作为数据库

使用前需要安装Bundler，Gem，Ruby，Rails，SQLite3等依赖环境。

## 安装运行

在终端（MacOS或Linux）中执行以下代码

```
$ git clone https://github.com/hontsev/PondFighting.git
$ cd PondFighting
$ bundle install
$ rake db:migrate
$ rails s 
```

在浏览器中输入`localhost:3000`访问主页