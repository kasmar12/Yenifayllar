.class public final enum Lcom/google/firestore/admin/v1/Index$QueryScope;
.super Ljava/lang/Enum;
.source "Index.java"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLite;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/admin/v1/Index;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "QueryScope"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/admin/v1/Index$QueryScope$QueryScopeVerifier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/admin/v1/Index$QueryScope;",
        ">;",
        "Lcom/google/protobuf/Internal$EnumLite;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/admin/v1/Index$QueryScope;

.field public static final enum COLLECTION:Lcom/google/firestore/admin/v1/Index$QueryScope;

.field public static final enum COLLECTION_GROUP:Lcom/google/firestore/admin/v1/Index$QueryScope;

.field public static final COLLECTION_GROUP_VALUE:I = 0x2

.field public static final COLLECTION_VALUE:I = 0x1

.field public static final enum QUERY_SCOPE_UNSPECIFIED:Lcom/google/firestore/admin/v1/Index$QueryScope;

.field public static final QUERY_SCOPE_UNSPECIFIED_VALUE:I

.field public static final enum UNRECOGNIZED:Lcom/google/firestore/admin/v1/Index$QueryScope;

.field private static final internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap<",
            "Lcom/google/firestore/admin/v1/Index$QueryScope;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 40
    new-instance v0, Lcom/google/firestore/admin/v1/Index$QueryScope;

    const-string v1, "QUERY_SCOPE_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/firestore/admin/v1/Index$QueryScope;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/admin/v1/Index$QueryScope;->QUERY_SCOPE_UNSPECIFIED:Lcom/google/firestore/admin/v1/Index$QueryScope;

    .line 50
    new-instance v1, Lcom/google/firestore/admin/v1/Index$QueryScope;

    const-string v3, "COLLECTION"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/google/firestore/admin/v1/Index$QueryScope;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/admin/v1/Index$QueryScope;->COLLECTION:Lcom/google/firestore/admin/v1/Index$QueryScope;

    .line 60
    new-instance v3, Lcom/google/firestore/admin/v1/Index$QueryScope;

    const-string v5, "COLLECTION_GROUP"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/google/firestore/admin/v1/Index$QueryScope;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/firestore/admin/v1/Index$QueryScope;->COLLECTION_GROUP:Lcom/google/firestore/admin/v1/Index$QueryScope;

    .line 61
    new-instance v5, Lcom/google/firestore/admin/v1/Index$QueryScope;

    const-string v7, "UNRECOGNIZED"

    const/4 v8, 0x3

    const/4 v9, -0x1

    invoke-direct {v5, v7, v8, v9}, Lcom/google/firestore/admin/v1/Index$QueryScope;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/google/firestore/admin/v1/Index$QueryScope;->UNRECOGNIZED:Lcom/google/firestore/admin/v1/Index$QueryScope;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/firestore/admin/v1/Index$QueryScope;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 31
    sput-object v7, Lcom/google/firestore/admin/v1/Index$QueryScope;->$VALUES:[Lcom/google/firestore/admin/v1/Index$QueryScope;

    .line 127
    new-instance v0, Lcom/google/firestore/admin/v1/Index$QueryScope$1;

    invoke-direct {v0}, Lcom/google/firestore/admin/v1/Index$QueryScope$1;-><init>()V

    sput-object v0, Lcom/google/firestore/admin/v1/Index$QueryScope;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 151
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 152
    iput p3, p0, Lcom/google/firestore/admin/v1/Index$QueryScope;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/admin/v1/Index$QueryScope;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 117
    :cond_0
    sget-object p0, Lcom/google/firestore/admin/v1/Index$QueryScope;->COLLECTION_GROUP:Lcom/google/firestore/admin/v1/Index$QueryScope;

    return-object p0

    .line 116
    :cond_1
    sget-object p0, Lcom/google/firestore/admin/v1/Index$QueryScope;->COLLECTION:Lcom/google/firestore/admin/v1/Index$QueryScope;

    return-object p0

    .line 115
    :cond_2
    sget-object p0, Lcom/google/firestore/admin/v1/Index$QueryScope;->QUERY_SCOPE_UNSPECIFIED:Lcom/google/firestore/admin/v1/Index$QueryScope;

    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Internal$EnumLiteMap<",
            "Lcom/google/firestore/admin/v1/Index$QueryScope;",
            ">;"
        }
    .end annotation

    .line 124
    sget-object v0, Lcom/google/firestore/admin/v1/Index$QueryScope;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static internalGetVerifier()Lcom/google/protobuf/Internal$EnumVerifier;
    .locals 1

    .line 137
    sget-object v0, Lcom/google/firestore/admin/v1/Index$QueryScope$QueryScopeVerifier;->INSTANCE:Lcom/google/protobuf/Internal$EnumVerifier;

    return-object v0
.end method

.method public static valueOf(I)Lcom/google/firestore/admin/v1/Index$QueryScope;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 110
    invoke-static {p0}, Lcom/google/firestore/admin/v1/Index$QueryScope;->forNumber(I)Lcom/google/firestore/admin/v1/Index$QueryScope;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/admin/v1/Index$QueryScope;
    .locals 1

    .line 31
    const-class v0, Lcom/google/firestore/admin/v1/Index$QueryScope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$QueryScope;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/admin/v1/Index$QueryScope;
    .locals 1

    .line 31
    sget-object v0, Lcom/google/firestore/admin/v1/Index$QueryScope;->$VALUES:[Lcom/google/firestore/admin/v1/Index$QueryScope;

    invoke-virtual {v0}, [Lcom/google/firestore/admin/v1/Index$QueryScope;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/admin/v1/Index$QueryScope;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 2

    .line 96
    sget-object v0, Lcom/google/firestore/admin/v1/Index$QueryScope;->UNRECOGNIZED:Lcom/google/firestore/admin/v1/Index$QueryScope;

    if-eq p0, v0, :cond_0

    .line 100
    iget v0, p0, Lcom/google/firestore/admin/v1/Index$QueryScope;->value:I

    return v0

    .line 97
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t get the number of an unknown enum value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
