# ベースイメージとして Ruby を使用
FROM ruby:3.2

# Node.js と Yarn をインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs
RUN npm install -g yarn

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# アプリケーションのディレクトリを作成
RUN mkdir /engineer_status
WORKDIR /engineer_status

# Gemfile および Gemfile.lock を追加
COPY Gemfile /engineer_status/Gemfile
COPY Gemfile.lock /engineer_status/Gemfile.lock

# bundle install を実行
RUN bundle install

# アプリケーションのソースコードを追加
COPY . /engineer_status
