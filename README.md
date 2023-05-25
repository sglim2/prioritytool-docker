# Run Priority-Tool under docker

```
git clone -b version4.3.0 git@github.com:sjharw/Prioritization-Tool.git
```

Edit the paramas file:

```
cp install.params.template install.params # and edit
```

```
docker compose build --no-cache
docker compose up -d
```
