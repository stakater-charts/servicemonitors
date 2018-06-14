{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "servicemonitors.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "servicemonitors.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "servicemonitors.labels.selector" -}}
app: {{ template "servicemonitors.name" . }}
group: {{ .Values.k8sServicemonitors.labels.group }}
provider: {{ .Values.k8sServicemonitors.labels.provider }}
{{- end -}}

{{- define "servicemonitors.labels.stakater" -}}
{{ template "servicemonitors.labels.selector" . }}
version: "{{ .Values.k8sServicemonitors.labels.version }}"
{{- end -}}

{{- define "servicemonitors.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
