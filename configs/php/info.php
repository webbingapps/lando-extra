<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/styles/default.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/highlight.min.js"></script>
  <!-- and it's easy to individually load additional languages -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/languages/go.min.js"></script>
</head>
<body>
  <pre><code class="language-plaintext">
    <?php

    /**
     * PHP info
     */

    //phpinfo();

    /**
     * Lando info
     */
    //$info = json_decode( getenv( 'LANDO_INFO' ), true );
    //print_r( $info );
    ?>
  </code></pre>

  <script>
    // Using Javascript/NodeJS for getting Lando info
    'use strict';
    var info = JSON.parse(process.env.LANDO_INFO);
    console.log(info);
  </script>
</body>
</html>