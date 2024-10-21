# authentik krb5 demo

1. Clone this repository
2. `./run.sh dev.authentik.company`. This domain must be accessible from your browser.
3. Configure your browser to use SPNEGO with the above domain.
4. Go to http://dev.authentik.company:9000/if/flow/initial-setup/
5. Create an admin user
6. Go to Admin Interface > Flows > default-authentication-flow > Stage Bindings > Edit the default-authentication-identification stage and select the Kerberos source.
7. Log out and try logging in with Kerberos

You can `export KRB5_CONFIG=krb5.conf` to use kerberos utilities locally such as `kinit`.
