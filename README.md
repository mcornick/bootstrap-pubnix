# bootstrap-pubnix

Bootstraps a minimal but functional environment using bash and vim.
Intended for pubnix hosts, but should be useful anywhere.

The script assumes bash and vim are installed. If vim is not installed,
the script will be unable to determine the prefix used for
bash-completion. vim should be installed pretty much everywhere these
days, but if the script can't find it, it should be harmless - it just
won't be able to find bash-completion. You can always edit the
generated .bashrc after the fact if needed.
