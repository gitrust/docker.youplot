FROM ruby:3.2.0-alpine3.17 AS builder

# Install system dependencies to build some Ruby gems
RUN apk add --update --no-cache build-base 
RUN gem install bundler

# build-time variable
ARG TOOL_VERSION="0.4.5"
RUN gem install youplot -v $TOOL_VERSION

# Using multi-stage build to reduce the size of the final image
FROM ruby:3.2.0-alpine3.17

# copy over the entire gems directory containing the build artifact
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/

# Create a dedicated user for running the application
RUN adduser -D app
USER app

WORKDIR /home/app

ENTRYPOINT ["youplot"]