.class public final Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;
.super Ljava/lang/Object;
.source "GeneratedAndroidFirebaseFirestore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PigeonFirebaseSettings"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings$Builder;
    }
.end annotation


# instance fields
.field private cacheSizeBytes:Ljava/lang/Long;

.field private host:Ljava/lang/String;

.field private ignoreUndefinedProperties:Ljava/lang/Boolean;

.field private persistenceEnabled:Ljava/lang/Boolean;

.field private sslEnabled:Ljava/lang/Boolean;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 232
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromList(Ljava/util/ArrayList;)Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)",
            "Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;"
        }
    .end annotation

    .line 294
    new-instance v0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;

    invoke-direct {v0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;-><init>()V

    const/4 v1, 0x0

    .line 295
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 296
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->setPersistenceEnabled(Ljava/lang/Boolean;)V

    const/4 v1, 0x1

    .line 297
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 298
    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->setHost(Ljava/lang/String;)V

    const/4 v1, 0x2

    .line 299
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 300
    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->setSslEnabled(Ljava/lang/Boolean;)V

    const/4 v1, 0x3

    .line 301
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    .line 305
    :cond_0
    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_1

    .line 306
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    goto :goto_0

    .line 307
    :cond_1
    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 305
    :goto_0
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 302
    :goto_1
    invoke-virtual {v0, v1}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->setCacheSizeBytes(Ljava/lang/Long;)V

    const/4 v1, 0x4

    .line 308
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .line 309
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->setIgnoreUndefinedProperties(Ljava/lang/Boolean;)V

    return-object v0
.end method


# virtual methods
.method public getCacheSizeBytes()Ljava/lang/Long;
    .locals 1

    .line 211
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->cacheSizeBytes:Ljava/lang/Long;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .line 191
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getIgnoreUndefinedProperties()Ljava/lang/Boolean;
    .locals 1

    .line 221
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->ignoreUndefinedProperties:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getPersistenceEnabled()Ljava/lang/Boolean;
    .locals 1

    .line 181
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->persistenceEnabled:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getSslEnabled()Ljava/lang/Boolean;
    .locals 1

    .line 201
    iget-object v0, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->sslEnabled:Ljava/lang/Boolean;

    return-object v0
.end method

.method public setCacheSizeBytes(Ljava/lang/Long;)V
    .locals 0

    .line 215
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->cacheSizeBytes:Ljava/lang/Long;

    return-void
.end method

.method public setHost(Ljava/lang/String;)V
    .locals 0

    .line 195
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->host:Ljava/lang/String;

    return-void
.end method

.method public setIgnoreUndefinedProperties(Ljava/lang/Boolean;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 228
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->ignoreUndefinedProperties:Ljava/lang/Boolean;

    return-void

    .line 226
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Nonnull field \"ignoreUndefinedProperties\" is null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPersistenceEnabled(Ljava/lang/Boolean;)V
    .locals 0

    .line 185
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->persistenceEnabled:Ljava/lang/Boolean;

    return-void
.end method

.method public setSslEnabled(Ljava/lang/Boolean;)V
    .locals 0

    .line 205
    iput-object p1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->sslEnabled:Ljava/lang/Boolean;

    return-void
.end method

.method public toList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 284
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 285
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->persistenceEnabled:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 286
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->sslEnabled:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->cacheSizeBytes:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    iget-object v1, p0, Lio/flutter/plugins/firebase/firestore/GeneratedAndroidFirebaseFirestore$PigeonFirebaseSettings;->ignoreUndefinedProperties:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
