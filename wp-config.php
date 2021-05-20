<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'thebrowncurves' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ':C.sg}bR2gRu7bPG)606XZt,./X.w[{Qa_g`hJdjWdSWu!~$M1BAcOv&V$B>k0Z|' );
define( 'SECURE_AUTH_KEY',  '/i&]EawdFWK{XYCAa2Jx8U@=;-7HW][)Br^3>5MC(?{N>HX#1dMi=P]H:/J}pQ~j' );
define( 'LOGGED_IN_KEY',    'WJy?L2=7Fq5fHK^>XI>4r,>^Q0esL Ls8SQL.(qd!AJ[Yqcn?,i-v) AH8H+NTy2' );
define( 'NONCE_KEY',        'Iq84^za!H*m-SkL/>wQUJQ9^H?&j7i:Pv[{a|j([KEa72I4g<==`;;dlsq3&Kr`N' );
define( 'AUTH_SALT',        '6FLEgr:p)l/5/ccI$VLS=ib$(`:kAkpnkhci]3U49c=@{f8*jgQ2<;^Fmi!o0fm4' );
define( 'SECURE_AUTH_SALT', '. RA%NE:OLz}8NZH[;*4|3er~gmk)lm{xZz!Yu|*Vv{WhS>aY@1{g57yI~?k5US ' );
define( 'LOGGED_IN_SALT',   'i-g36`oHRxyP$|T1)uVVrxpAbIHJHFP<9%~1zr@]d0G1-GRv{eDX]]6s%Vql pd{' );
define( 'NONCE_SALT',       '$1#%!d=[!.oMKzNxd^?uV2+jNW3T]3kr+-hKQsBj$<pqs}h~sITK<c})1Aed,<LD' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'tbc_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
