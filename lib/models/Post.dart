/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Post type in your schema. */
class Post {
  final String id;
  final String? _author;
  final String? _title;
  final String? _content;
  final bool? _isDone;
  final String? _url;
  final int? _ups;
  final int? _downs;
  final int? _version;

  String get author {
    try {
      return _author!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get title {
    return _title;
  }
  
  String? get content {
    return _content;
  }
  
  bool? get isDone {
    return _isDone;
  }
  
  String? get url {
    return _url;
  }
  
  int? get ups {
    return _ups;
  }
  
  int? get downs {
    return _downs;
  }
  
  int? get version {
    return _version;
  }
  
  const Post._internal({required this.id, required author, title, content, isDone, url, ups, downs, version}): _author = author, _title = title, _content = content, _isDone = isDone, _url = url, _ups = ups, _downs = downs, _version = version;
  
  factory Post({String? id, required String author, String? title, String? content, bool? isDone, String? url, int? ups, int? downs, int? version}) {
    return Post._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      author: author,
      title: title,
      content: content,
      isDone: isDone,
      url: url,
      ups: ups,
      downs: downs,
      version: version);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _author == other._author &&
      _title == other._title &&
      _content == other._content &&
      _isDone == other._isDone &&
      _url == other._url &&
      _ups == other._ups &&
      _downs == other._downs &&
      _version == other._version;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("author=" + "$_author" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("content=" + "$_content" + ", ");
    buffer.write("isDone=" + (_isDone != null ? _isDone!.toString() : "null") + ", ");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("ups=" + (_ups != null ? _ups!.toString() : "null") + ", ");
    buffer.write("downs=" + (_downs != null ? _downs!.toString() : "null") + ", ");
    buffer.write("version=" + (_version != null ? _version!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? id, String? author, String? title, String? content, bool? isDone, String? url, int? ups, int? downs, int? version}) {
    return Post._internal(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
      url: url ?? this.url,
      ups: ups ?? this.ups,
      downs: downs ?? this.downs,
      version: version ?? this.version);
  }
  
  Post copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String>? author,
    ModelFieldValue<String?>? title,
    ModelFieldValue<String?>? content,
    ModelFieldValue<bool?>? isDone,
    ModelFieldValue<String?>? url,
    ModelFieldValue<int?>? ups,
    ModelFieldValue<int?>? downs,
    ModelFieldValue<int?>? version
  }) {
    return Post._internal(
      id: id == null ? this.id : id.value,
      author: author == null ? this.author : author.value,
      title: title == null ? this.title : title.value,
      content: content == null ? this.content : content.value,
      isDone: isDone == null ? this.isDone : isDone.value,
      url: url == null ? this.url : url.value,
      ups: ups == null ? this.ups : ups.value,
      downs: downs == null ? this.downs : downs.value,
      version: version == null ? this.version : version.value
    );
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _author = json['author'],
      _title = json['title'],
      _content = json['content'],
      _isDone = json['isDone'],
      _url = json['url'],
      _ups = (json['ups'] as num?)?.toInt(),
      _downs = (json['downs'] as num?)?.toInt(),
      _version = (json['version'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'author': _author, 'title': _title, 'content': _content, 'isDone': _isDone, 'url': _url, 'ups': _ups, 'downs': _downs, 'version': _version
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'author': _author,
    'title': _title,
    'content': _content,
    'isDone': _isDone,
    'url': _url,
    'ups': _ups,
    'downs': _downs,
    'version': _version
  };

  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'id',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'author',
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'title',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'content',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'isDone',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'url',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'ups',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'downs',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.customTypeField(
      fieldName: 'version',
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
  });
}