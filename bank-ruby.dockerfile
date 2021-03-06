FROM ruby:2.5

RUN set -x \
  && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get purge -y --auto-remove wget

ENV PG_MAJOR 9.6

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update && apt-get install -y postgresql-client-$PG_MAJOR && rm -rf /var/lib/apt/lists/*

RUN gem update --system --no-document

RUN gem install --force bundler -v '>= 2'
