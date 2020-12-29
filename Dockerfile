FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs sudo

#bootstrapのJsを使うためにはWebpackerをインストールする必要がある。
#本当は「&&」でつなげたほうがいいと思う、、、キャッシュが軽くなるから。
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt update && sudo apt install yarn && yarn add jquery bootstrap popper.js

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
