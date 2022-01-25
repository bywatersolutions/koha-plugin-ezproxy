# EZProxy plugin for Koha

This plugin adds APIs to Koha for use with EZProxy.

## Installation

No configuration is required.
Just install this plugin and restart plack!

## Usage

This plugin exposes one API for EZProxy:

### API path
GET /api/v1/contrib/ezproxy/patron/check

### Parameters

#### user

Koha username or cardnumber

#### pass

Patron's password

## Security ⚠️

This API should *only* be used over _https_, as the user credentials are exposed in the URL.
