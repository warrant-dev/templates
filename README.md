# Warrant Templates

Templates for common authorization & access control use cases.

Clone, apply & deploy to prod directly within your Warrant environment.

## Available Templates

- [Devtool](/devtool) - ability to define `tenants`, `teams` within each tenant, `applications` owned by teams
- [Document store](/document-store) - ability to define `folder` and `document` hierarchies, edit/read-only access to specific documents
- [Enterprise access control](/enterprise-access-control) - ability to define `organizations`, `teams`, `users`, role based access, access to applications
- [Infrastructure access control](/infrastructure) - ability to define `teams` and `developers`, access to `services` by team

## Getting started

1. Create a Warrant account if you don't already have one.

2. Once logged in, [create a new environment](https://docs.warrant.dev/concepts/environments/) for testing.

3. Make sure you have the [Warrant CLI](https://docs.warrant.dev/command-line/) installed and set up on your machine. Configure it with the environment created above.

4. Clone this repository and pick a template to use:

```shell
cd devtool/
```

5. Apply object types schema for the chosen template using the Warrant CLI:

```shell
warrant objecttype apply -f object-types.json
```

6. Run scenario test cases using the Warrant CLI:

```shell
./test.sh
```

7. Tweak your model as needed. Once it's ready, [integrate Warrant into your application](https://docs.warrant.dev/quickstart/) using the SDKs.

8. Deploy to your prod environment!
