.class public final Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;
.super Ljava/lang/Object;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/inapppurchase/Messages;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PlatformAccountIdentifiers"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers$Builder;
    }
.end annotation


# instance fields
.field private obfuscatedAccountId:Ljava/lang/String;

.field private obfuscatedProfileId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;"
        }
    .end annotation

    .line 272
    new-instance v0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;

    invoke-direct {v0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;-><init>()V

    const/4 v1, 0x0

    .line 273
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 274
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->setObfuscatedAccountId(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 275
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 276
    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->setObfuscatedProfileId(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getObfuscatedAccountId()Ljava/lang/String;
    .locals 1

    .line 220
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->obfuscatedAccountId:Ljava/lang/String;

    return-object v0
.end method

.method public getObfuscatedProfileId()Ljava/lang/String;
    .locals 1

    .line 230
    iget-object v0, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->obfuscatedProfileId:Ljava/lang/String;

    return-object v0
.end method

.method public setObfuscatedAccountId(Ljava/lang/String;)V
    .locals 0

    .line 224
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->obfuscatedAccountId:Ljava/lang/String;

    return-void
.end method

.method public setObfuscatedProfileId(Ljava/lang/String;)V
    .locals 0

    .line 234
    iput-object p1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->obfuscatedProfileId:Ljava/lang/String;

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

    .line 265
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 266
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->obfuscatedAccountId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 267
    iget-object v1, p0, Lio/flutter/plugins/inapppurchase/Messages$PlatformAccountIdentifiers;->obfuscatedProfileId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
