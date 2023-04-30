<!DOCTYPE html>

<html>
  <head>
    <meta name="viewport" content="width=device-width" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#ajaxBtn").click(function () {
          $.ajax(
            "/AJAX/assets/js/scripts.js", // request url
            {
              success: function (data, status, xhr) {
                // success callback function
                $("p").append(data);
              },
            }
          );
        });
      });
    </script>
  </head>
  <body>
    <h1>jQuery ajax() demo</h1>
    <input type="button" id="ajaxBtn" value="Send Ajax request" />
    <p></p>
  </body>
</html>
