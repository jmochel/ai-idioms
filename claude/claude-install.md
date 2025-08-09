# Installation of Claude Code and NodeJS

## NVM

Download and install NVM using the official install script

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

Or if you prefer wget:

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```


Reload your shell to make nvm available 

```bash
source ~/.bashrc
```

Check NVM version 

```bash
nvm --version
```

## Install NodeJS

Install the latest stable Node.js version 

```bash
nvm install node
```

Install latest LTS (Long Term Support) version 

```bash
nvm install --lts 
```

List available versions 

```bash
nvm ls-remote --lts
```

Check Node.js version

```bash
node --version
```

Check npm version

```bash
npm --version
```

Check where they're installed

```bash
which node
which npm
```

Set default Node.js version
Set the current version as default

```bash
nvm alias default node
```

Or set a specific version as default

```bash
nvm alias default 20  # if you installed version 20
```

Useful NVM commands for later

List installed Node.js versions

```bash
nvm list
```

Switch between versions

```bash
nvm use 20
nvm use node  # latest
```

Install packages globally for current version

```bash
npm install -g <package-name>
```

## Install Claude

```bash
npm install -g @anthropic-ai/claude-code
```

## Install Context7 

```bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp
```


