#!/usr/bin/perl

use strict;
use warnings;

print STDERR "Generating constant definitions\n";

use ExtUtils::Constant;

my @names = qw(LIBSSH2_CALLBACK_DEBUG LIBSSH2_CALLBACK_DISCONNECT LIBSSH2_CALLBACK_IGNORE
               LIBSSH2_CALLBACK_MACERROR LIBSSH2_CALLBACK_X11 LIBSSH2_CHANNEL_EXTENDED_DATA_IGNORE
               LIBSSH2_CHANNEL_EXTENDED_DATA_MERGE LIBSSH2_CHANNEL_EXTENDED_DATA_NORMAL
               SSH_EXTENDED_DATA_STDERR LIBSSH2_EXTENDED_DATA_STDERR
               LIBSSH2_CHANNEL_FLUSH_ALL LIBSSH2_CHANNEL_FLUSH_EXTENDED_DATA
               LIBSSH2_CHANNEL_FLUSH_STDERR
               LIBSSH2_CHANNEL_MINADJUST LIBSSH2_CHANNEL_PACKET_DEFAULT
               LIBSSH2_CHANNEL_WINDOW_DEFAULT LIBSSH2_DH_GEX_MAXGROUP LIBSSH2_DH_GEX_MINGROUP
               LIBSSH2_DH_GEX_OPTGROUP LIBSSH2_ERROR_ALLOC LIBSSH2_ERROR_BANNER_NONE
               LIBSSH2_ERROR_NONE
               LIBSSH2_ERROR_BANNER_SEND LIBSSH2_ERROR_CHANNEL_CLOSED LIBSSH2_ERROR_CHANNEL_EOF_SENT
               LIBSSH2_ERROR_CHANNEL_FAILURE LIBSSH2_ERROR_CHANNEL_OUTOFORDER
               LIBSSH2_ERROR_CHANNEL_PACKET_EXCEEDED LIBSSH2_ERROR_CHANNEL_REQUEST_DENIED
               LIBSSH2_ERROR_CHANNEL_UNKNOWN LIBSSH2_ERROR_CHANNEL_WINDOW_EXCEEDED
               LIBSSH2_ERROR_DECRYPT LIBSSH2_ERROR_FILE LIBSSH2_ERROR_HOSTKEY_INIT
               LIBSSH2_ERROR_HOSTKEY_SIGN LIBSSH2_ERROR_INVAL LIBSSH2_ERROR_INVALID_MAC
               LIBSSH2_ERROR_INVALID_POLL_TYPE LIBSSH2_ERROR_KEX_FAILURE
               LIBSSH2_ERROR_KEY_EXCHANGE_FAILURE LIBSSH2_ERROR_METHOD_NONE
               LIBSSH2_ERROR_METHOD_NOT_SUPPORTED LIBSSH2_ERROR_PASSWORD_EXPIRED LIBSSH2_ERROR_PROTO
               LIBSSH2_ERROR_AUTHENTICATION_FAILED LIBSSH2_ERROR_PUBLICKEY_UNRECOGNIZED
               LIBSSH2_ERROR_PUBLICKEY_UNVERIFIED LIBSSH2_ERROR_REQUEST_DENIED
               LIBSSH2_ERROR_SCP_PROTOCOL LIBSSH2_ERROR_PUBLICKEY_PROTOCOL
               LIBSSH2_ERROR_SFTP_PROTOCOL LIBSSH2_ERROR_SOCKET_DISCONNECT LIBSSH2_ERROR_SOCKET_NONE
               LIBSSH2_ERROR_SOCKET_SEND LIBSSH2_ERROR_SOCKET_TIMEOUT LIBSSH2_ERROR_TIMEOUT
               LIBSSH2_ERROR_ZLIB LIBSSH2_ERROR_KNOWN_HOSTS LIBSSH2_FLAG_SIGPIPE
               LIBSSH2_FLAG_COMPRESS LIBSSH2_FXF_APPEND LIBSSH2_ERROR_EAGAIN
               LIBSSH2_SESSION_BLOCK_INBOUND LIBSSH2_SESSION_BLOCK_OUTBOUND LIBSSH2_TRACE_TRANS
               LIBSSH2_TRACE_KEX LIBSSH2_TRACE_AUTH LIBSSH2_TRACE_CONN LIBSSH2_TRACE_SCP
               LIBSSH2_TRACE_SFTP LIBSSH2_TRACE_ERROR LIBSSH2_TRACE_PUBLICKEY LIBSSH2_TRACE_SOCKET
               LIBSSH2_FXF_CREAT LIBSSH2_FXF_EXCL LIBSSH2_FXF_READ LIBSSH2_FXF_TRUNC
               LIBSSH2_FXF_WRITE LIBSSH2_FX_BAD_MESSAGE LIBSSH2_FX_CONNECTION_LOST
               LIBSSH2_FX_DIR_NOT_EMPTY LIBSSH2_FX_EOF LIBSSH2_FX_FAILURE
               LIBSSH2_FX_FILE_ALREADY_EXISTS LIBSSH2_FX_INVALID_FILENAME LIBSSH2_FX_INVALID_HANDLE
               LIBSSH2_FX_LINK_LOOP LIBSSH2_FX_LOCK_CONFlICT LIBSSH2_FX_NOT_A_DIRECTORY
               LIBSSH2_FX_NO_CONNECTION LIBSSH2_FX_NO_MEDIA LIBSSH2_FX_NO_SPACE_ON_FILESYSTEM
               LIBSSH2_FX_NO_SUCH_FILE LIBSSH2_FX_NO_SUCH_PATH LIBSSH2_FX_OK
               LIBSSH2_FX_OP_UNSUPPORTED LIBSSH2_FX_PERMISSION_DENIED LIBSSH2_FX_QUOTA_EXCEEDED
               LIBSSH2_FX_UNKNOWN_PRINCIPLE LIBSSH2_FX_WRITE_PROTECT LIBSSH2_H
               LIBSSH2_HOSTKEY_HASH_MD5 LIBSSH2_HOSTKEY_HASH_SHA1 LIBSSH2_METHOD_COMP_CS
               LIBSSH2_METHOD_COMP_SC LIBSSH2_METHOD_CRYPT_CS LIBSSH2_METHOD_CRYPT_SC
               LIBSSH2_METHOD_HOSTKEY LIBSSH2_METHOD_KEX LIBSSH2_METHOD_LANG_CS
               LIBSSH2_METHOD_LANG_SC LIBSSH2_METHOD_MAC_CS LIBSSH2_METHOD_MAC_SC
               LIBSSH2_PACKET_MAXCOMP LIBSSH2_PACKET_MAXDECOMP LIBSSH2_PACKET_MAXPAYLOAD
               LIBSSH2_POLLFD_CHANNEL LIBSSH2_POLLFD_CHANNEL_CLOSED LIBSSH2_POLLFD_LISTENER
               LIBSSH2_POLLFD_LISTENER_CLOSED LIBSSH2_POLLFD_POLLERR LIBSSH2_POLLFD_POLLEX
               LIBSSH2_POLLFD_POLLEXT LIBSSH2_POLLFD_POLLHUP LIBSSH2_POLLFD_POLLIN
               LIBSSH2_POLLFD_POLLNVAL LIBSSH2_POLLFD_POLLOUT LIBSSH2_POLLFD_POLLPRI
               LIBSSH2_POLLFD_SESSION_CLOSED LIBSSH2_POLLFD_SOCKET LIBSSH2_SFTP_ATTR_ACMODTIME
               LIBSSH2_SFTP_ATTR_EXTENDED LIBSSH2_SFTP_ATTR_PERMISSIONS LIBSSH2_SFTP_ATTR_SIZE
               LIBSSH2_SFTP_ATTR_UIDGID LIBSSH2_SFTP_LSTAT LIBSSH2_SFTP_OPENDIR
               LIBSSH2_SFTP_OPENFILE LIBSSH2_SFTP_PACKET_MAXLEN LIBSSH2_SFTP_READLINK
               LIBSSH2_SFTP_REALPATH LIBSSH2_SFTP_RENAME_ATOMIC LIBSSH2_SFTP_RENAME_NATIVE
               LIBSSH2_SFTP_RENAME_OVERWRITE LIBSSH2_SFTP_SETSTAT LIBSSH2_SFTP_STAT
               LIBSSH2_SFTP_SYMLINK LIBSSH2_SFTP_TYPE_BLOCK_DEVICE LIBSSH2_SFTP_TYPE_CHAR_DEVICE
               LIBSSH2_SFTP_TYPE_DIRECTORY LIBSSH2_SFTP_TYPE_FIFO LIBSSH2_SFTP_TYPE_REGULAR
               LIBSSH2_SFTP_TYPE_SOCKET LIBSSH2_SFTP_TYPE_SPECIAL LIBSSH2_SFTP_TYPE_SYMLINK
               LIBSSH2_SFTP_TYPE_UNKNOWN LIBSSH2_SFTP_VERSION LIBSSH2_SOCKET_POLL_MAXLOOPS
               LIBSSH2_SOCKET_POLL_UDELAY LIBSSH2_TERM_HEIGHT LIBSSH2_TERM_HEIGHT_PX
               LIBSSH2_TERM_WIDTH LIBSSH2_TERM_WIDTH_PX LIBSSH2_KNOWNHOST_TYPE_MASK
               LIBSSH2_KNOWNHOST_TYPE_PLAIN LIBSSH2_KNOWNHOST_TYPE_SHA1
               LIBSSH2_KNOWNHOST_TYPE_CUSTOM LIBSSH2_KNOWNHOST_KEYENC_MASK
               LIBSSH2_KNOWNHOST_KEYENC_RAW LIBSSH2_KNOWNHOST_KEYENC_BASE64
               LIBSSH2_KNOWNHOST_KEY_MASK LIBSSH2_KNOWNHOST_KEY_SHIFT LIBSSH2_KNOWNHOST_KEY_RSA1
               LIBSSH2_KNOWNHOST_KEY_SSHRSA LIBSSH2_KNOWNHOST_KEY_SSHDSS
               LIBSSH2_KNOWNHOST_CHECK_MATCH LIBSSH2_KNOWNHOST_CHECK_MISMATCH
               LIBSSH2_KNOWNHOST_CHECK_NOTFOUND LIBSSH2_KNOWNHOST_CHECK_FAILURE
               LIBSSH2_HOSTKEY_POLICY_STRICT LIBSSH2_HOSTKEY_POLICY_ASK LIBSSH2_HOSTKEY_POLICY_TOFU
               LIBSSH2_HOSTKEY_POLICY_ADVISORY
               LIBSSH2_FXFO_RDWR LIBSSH2_FXFO_RDONLY LIBSSH2_FXFO_READ
               LIBSSH2_FXFO_WRONLY LIBSSH2_FXFO_WRITE
               LIBSSH2_FXFO_APPEND LIBSSH2_FXFO_CREAT
               LIBSSH2_FXFO_TRUNC LIBSSH2_FXFO_EXCL
             );

ExtUtils::Constant::WriteConstants( NAME         => 'Net::SSH2',
                                    NAMES        => \@names,
                                    DEFAULT_TYPE => 'IV',
                                    C_FILE       => 'const-c.inc',
                                    XS_FILE      => 'const-xs.inc' );

open my $fh, '>', 'lib/Net/SSH2/Constants.pm' or die $!;

my @prefixes = qw(CALLBACK CHANNEL SOCKET TRACE ERROR HOSTKEY_HASH METHOD FXF FX SFTP DISCONNECT HOSTKEY_POLICY);
my %prefix2group = ( (map {$_, lc $_} @prefixes),
                     HOSTKEY_HASH   => 'hash',
                     HOSTKEY_POLICY => 'policy');

my $prefix_re = join('|', @prefixes);

my %groups;

for (@names) {
    if (/^LIBSSH2_($prefix_re)_/o) {
        my $group = $prefix2group{$1} or die "internal error, unknown group $1";
        push @{$groups{$group}}, $_;
    }
}

print $fh <<EOT;
package
     Net::SSH2::Constants;

# This file is generated automatically by util/gen_constants.pl

sub import { die "Do not use Net::SSH2::Constants!"; }

package
    Net::SSH2;

use strict;
use warnings;

use base 'Exporter';

our \@EXPORT_OK = qw(@names);
our \%EXPORT_TAGS = (
    all => \\\@EXPORT_OK,
EOT

for (sort keys %groups) {
     my @values = @{$groups{$_}};
     print $fh "    $_ => [qw(@values)],\n";
}

print $fh ");\n\n1;\n";
