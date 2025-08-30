.class public final Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/Messages$UserData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private displayName:Ljava/lang/String;

.field private email:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private idToken:Ljava/lang/String;

.field private photoUrl:Ljava/lang/String;

.field private serverAuthCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 315
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lio/flutter/plugins/googlesignin/Messages$UserData;
    .locals 2

    .line 360
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$UserData;

    invoke-direct {v0}, Lio/flutter/plugins/googlesignin/Messages$UserData;-><init>()V

    .line 361
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setDisplayName(Ljava/lang/String;)V

    .line 362
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->email:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setEmail(Ljava/lang/String;)V

    .line 363
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setId(Ljava/lang/String;)V

    .line 364
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->photoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setPhotoUrl(Ljava/lang/String;)V

    .line 365
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->idToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setIdToken(Ljava/lang/String;)V

    .line 366
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->serverAuthCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setServerAuthCode(Ljava/lang/String;)V

    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
    .locals 0

    .line 320
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->displayName:Ljava/lang/String;

    return-object p0
.end method

.method public setEmail(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
    .locals 0

    .line 327
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->email:Ljava/lang/String;

    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
    .locals 0

    .line 334
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->id:Ljava/lang/String;

    return-object p0
.end method

.method public setIdToken(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
    .locals 0

    .line 348
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->idToken:Ljava/lang/String;

    return-object p0
.end method

.method public setPhotoUrl(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
    .locals 0

    .line 341
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->photoUrl:Ljava/lang/String;

    return-object p0
.end method

.method public setServerAuthCode(Ljava/lang/String;)Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
    .locals 0

    .line 355
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;->serverAuthCode:Ljava/lang/String;

    return-object p0
.end method
