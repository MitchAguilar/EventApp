<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="App.Views.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width" />
    <title>Login</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
    <form runat="server">
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
                        <h4 id="textto" class="text-center"></h4>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" data-dismiss="modal">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="register-box">


            <div class="register-box-body">
                <div class="register-logo">
                    <a href="#"><b>Event</b> Aguacate</a>
                </div>
                <p class="login-box-msg">Registrar a un nuevo miembro</p>

                <form action="#" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group has-feedback">
                                <input type="text" id="P_Nombres" runat="server" required="required" class="form-control" placeholder="Nombres" />
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group has-feedback">
                                <input type="text" class="form-control" required="required" id="P_Apellidos" runat="server" placeholder="Apellidos" />
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="email" class="form-control" id="P_Correo" runat="server" required="required" placeholder="Email" />
                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" id="P_Direccion" required="required" runat="server" placeholder="Dirección" />
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group has-feedback">
                                <input type="password" class="form-control" required="required" maxlength="50" minlength="5" id="P_Password" runat="server" placeholder="Contraseña" />
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group has-feedback">
                                <input type="password" class="form-control" required="required" maxlength="50" minlength="5" id="P_Repit_Password" runat="server" placeholder="Repita Contraseña" />
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" required="required" maxlength="10" minlength="10" id="P_Telefono" runat="server" placeholder="Telefono" />
                        <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox" class="form-control" required="required" />
                                    Acepto los <a href="#">términos</a>
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-6">
                            <%--<button type="submit" class="btn btn-primary btn-block btn-flat">Registrar</button>--%>
                            <asp:Button Text="Registrar" ID="Registrar" runat="server" OnClick="Registrar_Click" CssClass="btn btn-primary btn-block btn-flat" />
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <div class="social-auth-links text-center">
                    <p>- OR -</p>
                    <a href="Login.aspx" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-list"></i>ya estás registrado? ingresar y loguete</a>
                </div>
            </div>
            <!-- /.form-box -->
        </div>
        <!-- /.register-box -->

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
