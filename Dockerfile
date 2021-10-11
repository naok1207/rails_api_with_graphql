FROM ruby:2.7.1

# 2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn \
  && apt-get install -y nodejs \
  && apt-get install -y vim

# 3
WORKDIR /app

# 4
COPY Gemfile .
COPY Gemfile.lock .
COPY package.json .
COPY yarn.lock .
RUN bundle install
RUN yarn install

# 5
COPY . /app

# 6
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]