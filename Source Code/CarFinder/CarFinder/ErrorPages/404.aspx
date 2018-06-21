<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" MasterPageFile="~/View/Site.Master" Inherits="prototype.ErrorPages._404" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h1 style="margin-top: 20px;">Page not found!</h1>
        Things to do:
        <asp:HyperLink ID="hyperlink1"
                NavigateUrl="~/View/CarFinder.aspx"
                Text="Return to home"
                runat="server" />
    </div>
</asp:Content>