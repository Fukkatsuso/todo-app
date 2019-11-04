FROM node:lts-alpine

RUN mkdir /app
WORKDIR /app

RUN npm install -g @vue/cli

CMD ["/bin/sh"]

### initial setup ###
# $ docker build -t vue-cli-setup .
# $ docker run -it --rm -v `pwd`:/app vue-cli-setup
# /app # vue create .
# Vue CLI v4.0.5
# ? Please pick a preset: Manually select features
# ? Check the features needed for your project: Babel, Router, Linter
# ? Use history mode for router? (Requires proper server setup for index fallback in production) Yes
# ? Pick a linter / formatter config: Basic
# ? Pick additional lint features: (Press <space> to select, <a> to toggle all, <i> to invert selection)Lint on save
# ? Where do you prefer placing config for Babel, PostCSS, ESLint, etc.? In dedicated config files
# ? Save this as a preset for future projects? No
# ? Pick the package manager to use when installing dependencies: NPM