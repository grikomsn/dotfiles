function node-update-globals --description 'update node related package managers and global packages'
    npm -g i npm corepack
    corepack enable pnpm
    corepack enable yarn
    corepack prepare --activate pnpm@latest
    corepack prepare --activate yarn@1.22.19
    set -l NODE_GLOBAL_PACKAGES fish-lsp neovim prettier serve tsx vercel
    pnpm --global add $NODE_GLOBAL_PACKAGES
end
