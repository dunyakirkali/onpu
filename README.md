# Onpu

![](https://img.shields.io/badge/Ruby-2.3.1-green.svg)
![](https://img.shields.io/badge/Rails-5.0.0.1-green.svg)
[![Circle CI](https://circleci.com/gh/ahtung/onpu/tree/master.svg?style=shield&circle-token=395a9cc061c0ca14015d4da44de6e3f25561e373)](https://circleci.com/gh/ahtung/onpu/tree/master)
[![Coverage Status](https://coveralls.io/repos/github/ahtung/onpu/badge.svg?branch=master&t=VAscs6)](https://coveralls.io/github/ahtung/onpu?branch=master)

## Tech

- Postgres

## Develop

### Run

    foreman start -e Procfile.dev.env -f Procfile.dev

## Test

In order to run the specs use the usual

    foreman run -e Procfile.dev.env rspec (development)
