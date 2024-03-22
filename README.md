# mastodon-action

A simple GitHub Action to post to Mastodon.

## First get an Application Token

1. Log in to the Mastodon account you want to post from.
2. Open the settings page.
3. Go to the development tab.
4. Click "New Application"
5. The application needs `write:statuses` permissions and nothing else.
6. Copy the Access Token. Keep it private and add it as a secret to the repository using this action.

## To use this action

```
    - name: Post to Mastodon
      uses: aeisenberg/mastodon-action@v1
      with:
        instance: 'YOUR INSTANCE'
        token: ${{ secrets.MASTODON_TOKEN }}
        status: 'Hello, World!'
        visibility: 'private' # one of public, unlisted, private, direct
```
