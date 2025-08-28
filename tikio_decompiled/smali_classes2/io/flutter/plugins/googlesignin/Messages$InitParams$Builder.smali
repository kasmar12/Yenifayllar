.class public final Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/Messages$InitParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
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
.method public constructor <init>()V
    .locals 0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/googlesignin/Messages$InitParams;
    .locals 2

    .line 197
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$InitParams;

    invoke-direct {v0}, Lio/flutter/plugins/googlesignin/Messages$InitParams;-><init>()V

    .line 198
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->scopes:Ljava/util/List;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setScopes(Ljava/util/List;)V

    .line 199
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->signInType:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setSignInType(Lio/flutter/plugins/googlesignin/Messages$SignInType;)V

    .line 200
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->hostedDomain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setHostedDomain(Ljava/lang/String;)V

    .line 201
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setClientId(Ljava/lang/String;)V

    .line 202
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->serverClientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setServerClientId(Ljava/lang/String;)V

    .line 203
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->forceCodeForRefreshToken:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$InitParams;->setForceCodeForRefreshToken(Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public setClientId(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
    .locals 0

    .line 178
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->clientId:Ljava/lang/String;

    return-object p0
.end method

.method public setForceCodeForRefreshToken(Ljava/lang/Boolean;)Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
    .locals 0

    .line 192
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->forceCodeForRefreshToken:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setHostedDomain(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
    .locals 0

    .line 171
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->hostedDomain:Ljava/lang/String;

    return-object p0
.end method

.method public setScopes(Ljava/util/List;)Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;"
        }
    .end annotation

    .line 157
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->scopes:Ljava/util/List;

    return-object p0
.end method

.method public setServerClientId(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
    .locals 0

    .line 185
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->serverClientId:Ljava/lang/String;

    return-object p0
.end method

.method public setSignInType(Lio/flutter/plugins/googlesignin/Messages$SignInType;)Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;
    .locals 0

    .line 164
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$InitParams$Builder;->signInType:Lio/flutter/plugins/googlesignin/Messages$SignInType;

    return-object p0
.end method
