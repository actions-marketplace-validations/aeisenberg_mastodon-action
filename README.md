# mastodon-action

A simple GitHub Action to post to Mastodon.

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
