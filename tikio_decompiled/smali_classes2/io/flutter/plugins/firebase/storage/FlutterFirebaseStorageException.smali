.class Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;
.super Ljava/lang/Object;
.source "FlutterFirebaseStorageException.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCode(I)Ljava/lang/String;
    .locals 1

    const/16 v0, -0x32f0

    if-eq p0, v0, :cond_4

    const/16 v0, -0x32e7

    if-eq p0, v0, :cond_3

    const/16 v0, -0x32e6

    if-eq p0, v0, :cond_2

    const/16 v0, -0x32dd

    if-eq p0, v0, :cond_1

    const/16 v0, -0x32dc

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    const-string p0, "unknown"

    return-object p0

    :pswitch_0
    const-string p0, "object-not-found"

    return-object p0

    :pswitch_1
    const-string p0, "bucket-not-found"

    return-object p0

    :pswitch_2
    const-string p0, "project-not-found"

    return-object p0

    :pswitch_3
    const-string p0, "quota-exceeded"

    return-object p0

    :cond_0
    const-string p0, "unauthenticated"

    return-object p0

    :cond_1
    const-string p0, "unauthorized"

    return-object p0

    :cond_2
    const-string p0, "retry-limit-exceeded"

    return-object p0

    :cond_3
    const-string p0, "invalid-checksum"

    return-object p0

    :cond_4
    const-string p0, "canceled"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch -0x32d5
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getMessage(I)Ljava/lang/String;
    .locals 1

    const/16 v0, -0x32f0

    if-eq p0, v0, :cond_4

    const/16 v0, -0x32e7

    if-eq p0, v0, :cond_3

    const/16 v0, -0x32e6

    if-eq p0, v0, :cond_2

    const/16 v0, -0x32dd

    if-eq p0, v0, :cond_1

    const/16 v0, -0x32dc

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    const-string p0, "An unknown error occurred"

    return-object p0

    :pswitch_0
    const-string p0, "No object exists at the desired reference."

    return-object p0

    :pswitch_1
    const-string p0, "No bucket is configured for Firebase Storage."

    return-object p0

    :pswitch_2
    const-string p0, "No project is configured for Firebase Storage."

    return-object p0

    :pswitch_3
    const-string p0, "Quota on your Firebase Storage bucket has been exceeded."

    return-object p0

    :cond_0
    const-string p0, "User is unauthenticated. Authenticate and try again."

    return-object p0

    :cond_1
    const-string p0, "User is not authorized to perform the desired action."

    return-object p0

    :cond_2
    const-string p0, "The maximum time limit on an operation (upload, download, delete, etc.) has been exceeded."

    return-object p0

    :cond_3
    const-string p0, "File on the client does not match the checksum of the file received by the server."

    return-object p0

    :cond_4
    const-string p0, "User cancelled the operation."

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch -0x32d5
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static parserExceptionToFlutter(Ljava/lang/Exception;)Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;
    .locals 4

    const/4 v0, 0x0

    const-string v1, "UNKNOWN"

    if-nez p0, :cond_0

    .line 16
    new-instance p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    const-string v2, "An unknown error occurred"

    invoke-direct {p0, v1, v2, v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0

    .line 20
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "An unknown error occurred:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 23
    instance-of v3, p0, Lcom/google/firebase/storage/StorageException;

    if-eqz v3, :cond_1

    .line 24
    check-cast p0, Lcom/google/firebase/storage/StorageException;

    invoke-virtual {p0}, Lcom/google/firebase/storage/StorageException;->getErrorCode()I

    move-result p0

    .line 25
    invoke-static {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->getCode(I)Ljava/lang/String;

    move-result-object v1

    .line 26
    invoke-static {p0}, Lio/flutter/plugins/firebase/storage/FlutterFirebaseStorageException;->getMessage(I)Ljava/lang/String;

    move-result-object v2

    .line 29
    :cond_1
    new-instance p0, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;

    invoke-direct {p0, v1, v2, v0}, Lio/flutter/plugins/firebase/storage/GeneratedAndroidFirebaseStorage$FlutterError;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p0
.end method
