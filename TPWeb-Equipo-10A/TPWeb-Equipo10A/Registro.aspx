<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPWeb_Equipo10A.Registro" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            max-width: 400px;
            margin: 10px auto;
            padding: 15px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .form-title {
            text-align: center;
            margin-bottom: 10px;
            font-size: 22px;
            color: #333;
        }
        .form-subtitle {
            text-align: left;
            margin-bottom: 15px;
            font-size: 18px;
            color: #666;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-label {
            display: block;
            margin-bottom: 3px;
            font-weight: normal;
            color: #333;
            font-size: 13px;
        }
        .form-control {
            width: 100%;
            padding: 6px;
            border: 2px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            height: 32px;
        }
        .email-container {
            display: flex;
            align-items: center;
        }
        .email-at {
            background-color: #f8f9fa;
            border: 2px solid #ddd;
            border-right: none;
            padding: 6px;
            border-radius: 4px 0 0 4px;
            font-weight: bold;
            font-size: 13px;
            height: 32px;
            display: flex;
            align-items: center;
        }
        .email-input {
            border-radius: 0 4px 4px 0;
            border-left: none;
        }
        .checkbox-container {
            margin: 10px 0;
        }
        .checkbox-label {
            display: flex;
            align-items: center;
            font-size: 12px;
        }
        .checkbox-input {
            margin-right: 8px;
        }
        .btn-participar {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-participar:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2 class="form-title">Registro</h2>
        <h3 class="form-subtitle">Ingrésa tus datos:</h3>
        
        <div class="form-group">
            <label class="form-label">DNI</label>
            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label class="form-label">Apellido</label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label class="form-label">Email</label>
            <div class="email-container">
                <div class="email-at">@</div>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control email-input" placeholder=""></asp:TextBox>
            </div>
        </div>
        
        <div class="form-group">
            <label class="form-label">Dirección</label>
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label class="form-label">Ciudad</label>
            <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        
        <div class="form-group">
            <label class="form-label">CP</label>
            <asp:TextBox ID="txtCP" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
        </div>
        
        <div class="checkbox-container">
            <label class="checkbox-label">
                <asp:CheckBox ID="chkTerminos" runat="server" CssClass="checkbox-input" />
                Acepto los términos y condiciones.
            </label>
        </div>
        
        <asp:Button ID="btnParticipar" runat="server" Text="Participar!" CssClass="btn-participar" OnClick="btnParticipar_Click" />
    </div>
</asp:Content>

