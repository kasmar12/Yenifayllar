.class public final Lio/flutter/plugins/googlesignin/Messages$InitParams;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "InitParams"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
    }
.end annotation


# instance fields
.field private clientId:Ljava/lang/String;

.field private forceCodeForRefreshToken:Ljava/lang/Boolean;

.field private hostedDomain:Ljava/lang/String;

.field private scopes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private serverClientId:Ljava/lang/String;

.field private signInType:Lio/flutter/plugins/googlesignin/Messages$SignInType;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/googlesignin/Messages$InitParams;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/googlesignin/Messages$InitParams;"
        }
    .end annotation

    .line 221
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$InitParams;

    invoke-direct {v0}, Lio/flutter/plugins/googlesignin/Messages$InitParams;-><init>()V

    const/4 v1, 0x0

    .line 222
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 223
    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setScopes(Ljava/util/List;)V

    const/4 v1, 0x1

    .line 224
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 225
    :cond_0
    invoke-static {}, Lio/flutter/plugins/googlesignin/Messages$SignInType;->values()[Lio/flutter/plugins/googlesignin/Messages$SignInType;

    move-result-object v2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v1, v2, v1

    :goto_0
    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setSignInType(Lio/flutter/plugins/googlesignin/Messages$SignInType;)V

    const/4 v1, 0x2

    .line 226
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 227
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setHostedDomain(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 228
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 229
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setClientId(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 230
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 231
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setServerClientId(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 232
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 233
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setForceCodeForRefreshToken(Ljava/lang/Boolean;)V

    return-object v0
.end method


# virtual methods
.method public getClientId()Ljava/lang/String;
    .locals 1

    .line 119
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->clientId:Ljava/lang/String;

    return-object v0
.end method

.method public getForceCodeForRefreshToken()Ljava/lang/Boolean;
    .locals 1

    .line 139
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->forceCodeForRefreshToken:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getHostedDomain()Ljava/lang/String;
    .locals 1

    .line 109
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->hostedDomain:Ljava/lang/String;

    return-object v0
.end method

.method public getScopes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->scopes:Ljava/util/List;

    return-object v0
.end method

.method public getServerClientId()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->serverClientId:Ljava/lang/String;

    return-object v0
.end method

.method public getSignInType()Lio/flutter/plugins/googlesignin/Messages$SignInType;
    .locals 1

    .line 96
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->signInType:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    return-object v0
.end method

.method public setClientId(Ljava/lang/String;)V
    .locals 0

    .line 123
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->clientId:Ljava/lang/String;

    return-void
.end method

.method public setForceCodeForRefreshToken(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 146
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->forceCodeForRefreshToken:Ljava/lang/Boolean;

    return-void

    .line 144
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"forceCodeForRefreshToken\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setHostedDomain(Ljava/lang/String;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->hostedDomain:Ljava/lang/String;

    return-void
.end method

.method public setScopes(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 90
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->scopes:Ljava/util/List;

    return-void

    .line 88
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"scopes\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setServerClientId(Ljava/lang/String;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->serverClientId:Ljava/lang/String;

    return-void
.end method

.method public setSignInType(Lio/flutter/plugins/googlesignin/Messages$SignInType;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 103
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->signInType:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    return-void

    .line 101
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"signInType\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 210
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 211
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->scopes:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 212
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->signInType:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget v1, v1, Lio/flutter/plugins/googlesignin/Messages$SignInType;->index:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->hostedDomain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 214
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 215
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->serverClientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 216
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams;->forceCodeForRefreshToken:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
