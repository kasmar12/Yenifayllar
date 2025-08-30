.class public final Lio/flutter/plugins/googlesignin/Messages$UserData;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/googlesignin/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserData"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/googlesignin/Messages$UserData$Builder;
    }
.end annotation


# instance fields
.field private displayName:Ljava/lang/String;

.field private email:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private idToken:Ljava/lang/String;

.field private photoUrl:Ljava/lang/String;

.field private serverAuthCode:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/googlesignin/Messages$UserData;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/googlesignin/Messages$UserData;"
        }
    .end annotation

    .line 384
    new-instance v0, Lio/flutter/plugins/googlesignin/Messages$UserData;

    invoke-direct {v0}, Lio/flutter/plugins/googlesignin/Messages$UserData;-><init>()V

    const/4 v1, 0x0

    .line 385
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 386
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setDisplayName(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 387
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 388
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setEmail(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 389
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 390
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setId(Ljava/lang/String;)V

    const/4 v1, 0x3

    .line 391
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 392
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setPhotoUrl(Ljava/lang/String;)V

    const/4 v1, 0x4

    .line 393
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 394
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setIdToken(Ljava/lang/String;)V

    const/4 v1, 0x5

    .line 395
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 396
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/googlesignin/Messages$UserData;->setServerAuthCode(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .line 249
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .line 259
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 272
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getIdToken()Ljava/lang/String;
    .locals 1

    .line 295
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->idToken:Ljava/lang/String;

    return-object v0
.end method

.method public getPhotoUrl()Ljava/lang/String;
    .locals 1

    .line 285
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->photoUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getServerAuthCode()Ljava/lang/String;
    .locals 1

    .line 305
    iget-object v0, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->serverAuthCode:Ljava/lang/String;

    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .locals 0

    .line 253
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->displayName:Ljava/lang/String;

    return-void
.end method

.method public setEmail(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 266
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->email:Ljava/lang/String;

    return-void

    .line 264
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"email\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setId(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 279
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->id:Ljava/lang/String;

    return-void

    .line 277
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"id\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setIdToken(Ljava/lang/String;)V
    .locals 0

    .line 299
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->idToken:Ljava/lang/String;

    return-void
.end method

.method public setPhotoUrl(Ljava/lang/String;)V
    .locals 0

    .line 289
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->photoUrl:Ljava/lang/String;

    return-void
.end method

.method public setServerAuthCode(Ljava/lang/String;)V
    .locals 0

    .line 309
    iput-object p1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->serverAuthCode:Ljava/lang/String;

    return-void
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

    .line 373
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 374
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 375
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->email:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 376
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 377
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->photoUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 378
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->idToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    iget-object v1, p0, Lio/flutter/plugins/googlesignin/Messages$UserData;->serverAuthCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
