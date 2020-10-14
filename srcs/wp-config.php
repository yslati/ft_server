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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define('AUTH_KEY',         'Y^m|JiP@vnuI-/B]}jf{*_}(Ma<,I_Ephz6t5D5HQcCo*nK(,cK@D1m[a%n_zG{7');
define('SECURE_AUTH_KEY',  'Fa[KW86X;rx%pPZs0Bx](IKk/(({;Y1?!bx o+(:=^=&ce2b|mu!0pddD44:f+hc');
define('LOGGED_IN_KEY',    'm |v%nPPqJU~Eenz&f|gZxR:(>,uuAMl}Z(r)xx:_]jJI<+g+[Zd(^0NMJU6JcV_');
define('NONCE_KEY',        'Viy<<`Vug3h}S zeeeb]/?;7xpuAA@A~=53_|))~-GPjR+m% 9J5(2m`T+gRWaE[');
define('AUTH_SALT',        '&>q3cT<V%:!..]J|Hd gxK4.#Ft(e6C|Se/r9&|YYrs,L0VW]_9>|UU%lgM)5<QZ');
define('SECURE_AUTH_SALT', 't-M@dl[0.`:R--S>t@ai+G|pL_V3 (9~+hr}g?fdu=`UU+ue3h6McW{~h/wr+~AB');
define('LOGGED_IN_SALT',   ']ny2]b7YT-b+YIQD*dbO`,li8E1g2(iw|-rqk|px|WCl@t^}Fk<_3Z<y[kSv6m|O');
define('NONCE_SALT',       ',^+0+te<-y@ ~@l%85]]/}}DyH[R9(eGs3;1UYR-_1O/|QmZ&!$dpt3jZ-1Im5gi');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );