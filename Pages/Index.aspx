<%@ Page Title="" Language="C#" MasterPageFile="~/Calculadora.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Calculadora.Pages.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Calculadora Chida
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Styles/styles.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <form runat="server">
        <div class="calculator_container">
            <asp:TextBox runat="server" ID="input_number" CssClass="input_number" MaxLength="25" placeholder="0"></asp:TextBox>
            <div class="buttons_container">
                <asp:Button runat="server" ID="num1" Text="1" OnClientClick="getButtonValue(1); return false;"></asp:Button>
                <asp:Button runat="server" ID="num2" Text="2" OnClientClick="getButtonValue(2); return false;"></asp:Button>
                <asp:Button runat="server" ID="num3" Text="3" OnClientClick="getButtonValue(3); return false;"></asp:Button>
                <asp:Button runat="server" ID="div" Text="/" OnClientClick="getButtonValue('/'); return false;"></asp:Button>
                <asp:Button runat="server" ID="num4" Text="4" OnClientClick="getButtonValue(4); return false;"></asp:Button>
                <asp:Button runat="server" ID="num5" Text="5" OnClientClick="getButtonValue(5); return false;"></asp:Button>
                <asp:Button runat="server" ID="num6" Text="6" OnClientClick="getButtonValue(6); return false;"></asp:Button>
                <asp:Button runat="server" ID="mul" Text="X" OnClientClick="getButtonValue('X'); return false;"></asp:Button>
                <asp:Button runat="server" ID="num7" Text="7" OnClientClick="getButtonValue(7); return false;"></asp:Button>
                <asp:Button runat="server" ID="num8" Text="8" OnClientClick="getButtonValue(8); return false;"></asp:Button>
                <asp:Button runat="server" ID="num9" Text="9" OnClientClick="getButtonValue(9); return false;"></asp:Button>
                <asp:Button runat="server" ID="res" Text="-" OnClientClick="getButtonValue('-'); return false;"></asp:Button>
                <asp:Button runat="server" ID="masmenos" Text="+/-" OnClientClick="getButtonValue('+/-'); return false;"></asp:Button>
                <asp:Button runat="server" ID="num0" Text="0" OnClientClick="getButtonValue(0); return false;"></asp:Button>
                <asp:Button runat="server" ID="punto" Text="." OnClientClick="getButtonValue('.'); return false;"></asp:Button>
                <asp:Button runat="server" ID="sum" Text="+" OnClientClick="getButtonValue('+'); return false;"></asp:Button>
                <asp:Button runat="server" ID="BtnEnter" Text="Enter" OnClick="BtnEnter_Click"></asp:Button>
                <asp:Button runat="server" ID="clear" Text="C" OnClientClick="return false;"></asp:Button>
            </div>
        </div>

        <div>
            <asp:GridView runat="server" ID="OperationsGridView">
                <Columns>
                    <asp:TemplateField HeaderText="Opciones">
                        <ItemTemplate>
                            <asp:Button runat="server" Text="Borrar" ID="BtnDelete" OnClick="BtnDelete_Click"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script src="../Scripts/app.js"></script>
</asp:Content>
