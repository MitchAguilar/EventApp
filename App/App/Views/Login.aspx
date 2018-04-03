<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="App.Views.Logi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width" />
    <title>Login</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1,  user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../Style/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../Style/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../Style/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../Style/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../Style/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <style>
        body {
            background-image: url(../Style/images/fondo.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            overflow: hidden;
        }
    </style>
    <script>
        function openInfo3(cadena, lo) {
            if (lo == 1) {
                $('#info3').modal()
                var tex = document.getElementById('textUn')
                tex.innerHTML = cadena;
            } else {
                $('#info4').modal()
                var tex = document.getElementById('textto')
                tex.innerHTML = cadena;
            }
        }
    </script>
</head>
<body class="hold-transition">
    <div id="info3" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="../Views/images/error.png" class="img-responsive center-block" />
                    <h3 id="textUn" class="text-center"></h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
    <%--modal bien--%>
    <div id="info4" class="modal fade" role="dialog">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <img src="../Views/images/true.jpg" class="img-responsive center-block" />
                    <h3 id="textto" class="text-center"></h3>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>


    <form runat="server">

        <div class="login-box">

            <!-- /.login-logo -->
            <div class="login-box-body">
                <div class="login-logo">
                    <a href="#"><b>Mitch</b> Aguacate</a>
                </div>
                <p class="login-box-msg">Inicia sesión para continuar al menú</p>

                <form action="#" method="post">
                    <div class="form-group has-feedback">
                        <input type="email" required="required" id="U_usuario" runat="server" maxlength="50" class="form-control" placeholder="Email">
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" required="required" id="U_Password" runat="server" maxlength="30" minlength="5" placeholder="Password">
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox">
                                    Recuerdame
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-6">
                            <asp:Button runat="server" ID="Login" Text="Iniciar Sesión" CssClass="btn btn-primary btn-block btn-flat" OnClick="Login_Click" />
                            <%--<a href="PrivateViews/index.aspx" class="btn btn-primary btn-block btn-flat">Iniciar Sesión</a>--%>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <div class="social-auth-links text-center">
                    <p>- OR -</p>
                    <a href="Register.aspx" class="btn btn-block btn-social btn-danger btn-flat">
                        <i class="fa fa-list"></i>No estás registrado? ingresa y Registrate
                    </a>
                </div>
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->
        <!-- jQuery 3 -->
        <script src="../Style/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="../Style/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="../Style/plugins/iCheck/icheck.min.js"></script>
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' /* optional */
                });
            });
        </script>

    </form>
</body>
</html>
