.class public final enum Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;
.super Ljava/lang/Enum;
.source "TextInputChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/flutter/embedding/engine/systemchannels/TextInputChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TextInputType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum DATETIME:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum EMAIL_ADDRESS:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum MULTILINE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum NAME:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum NONE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum NUMBER:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum PHONE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum POSTAL_ADDRESS:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum TEXT:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum URL:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

.field public static final enum VISIBLE_PASSWORD:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;


# instance fields
.field private final encodedName:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;
    .locals 3

    const/16 v0, 0xb

    new-array v0, v0, [Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 709
    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->TEXT:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->DATETIME:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->NAME:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->POSTAL_ADDRESS:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->NUMBER:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->PHONE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->MULTILINE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->EMAIL_ADDRESS:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->URL:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->VISIBLE_PASSWORD:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->NONE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 710
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "TEXT"

    const/4 v2, 0x0

    const-string v3, "TextInputType.text"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->TEXT:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 711
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "DATETIME"

    const/4 v2, 0x1

    const-string v3, "TextInputType.datetime"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->DATETIME:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 712
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "NAME"

    const/4 v2, 0x2

    const-string v3, "TextInputType.name"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->NAME:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 713
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "POSTAL_ADDRESS"

    const/4 v2, 0x3

    const-string v3, "TextInputType.address"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->POSTAL_ADDRESS:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 714
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "NUMBER"

    const/4 v2, 0x4

    const-string v3, "TextInputType.number"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->NUMBER:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 715
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "PHONE"

    const/4 v2, 0x5

    const-string v3, "TextInputType.phone"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->PHONE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 716
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "MULTILINE"

    const/4 v2, 0x6

    const-string v3, "TextInputType.multiline"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->MULTILINE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 717
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "EMAIL_ADDRESS"

    const/4 v2, 0x7

    const-string v3, "TextInputType.emailAddress"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->EMAIL_ADDRESS:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 718
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "URL"

    const/16 v2, 0x8

    const-string v3, "TextInputType.url"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->URL:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 719
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "VISIBLE_PASSWORD"

    const/16 v2, 0x9

    const-string v3, "TextInputType.visiblePassword"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->VISIBLE_PASSWORD:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 720
    new-instance v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    const-string v1, "NONE"

    const/16 v2, 0xa

    const-string v3, "TextInputType.none"

    invoke-direct {v0, v1, v2, v3}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->NONE:Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    .line 709
    invoke-static {}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->$values()[Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    move-result-object v0

    sput-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->$VALUES:[Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 733
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 734
    iput-object p3, p0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->encodedName:Ljava/lang/String;

    return-void
.end method

.method static fromValue(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;
        }
    .end annotation

    .line 723
    invoke-static {}, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->values()[Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 724
    iget-object v4, v3, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->encodedName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 728
    :cond_1
    new-instance v0, Ljava/lang/NoSuchFieldException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No such TextInputType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;
    .locals 1

    .line 709
    const-class v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    return-object p0
.end method

.method public static values()[Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;
    .locals 1

    .line 709
    sget-object v0, Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->$VALUES:[Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    invoke-virtual {v0}, [Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/flutter/embedding/engine/systemchannels/TextInputChannel$TextInputType;

    return-object v0
.end method
