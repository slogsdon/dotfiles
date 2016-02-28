<?php
/**
 * Installs user files
 *
 * PHP Version 5.6
 *
 * @category System
 * @package  Dotfiles
 * @author   Shane Logsdon <shane@shanelogsdon.com>
 * @license  MIT <https://opensource.org/licenses/MIT>
 * @link     https://github.com/slogsdon/dotfiles
 */

$home = getenv('HOME');
$files = [
    // name          => [hidden?, dest]
    'tmux/tmux.conf' => [true,    [$home]],
    'zsh/zshrc'      => [true,    [$home]],
    'zsh/zshenv'     => [true,    [$home]],
    'weechat'        => [true,    [$home]],
    'spacemacs'      => [true,    [$home]],
    'hushlogin'      => [true,    [$home]],
    'nvim'           => [false,   [$home, '.config']],
];

foreach ($files as $file => $opts) {
    $prefix = $opts[0] ? '.' : '';
    $source = implode(DIRECTORY_SEPARATOR, [$home, '.dotfiles', $file]);
    $dest   = implode(
        DIRECTORY_SEPARATOR,
        array_merge($opts[1], [$prefix . basename($file)])
    );
    if (!file_exists($dest)) {
        printf('==> symlinking %s to %s%s', $file, $dest, PHP_EOL);
        symlink($source, $dest);
    }
}
