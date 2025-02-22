{{- define "partials.network-validator" -}}
name: linkerd-network-validator
image: {{.Values.proxy.image.name}}:{{.Values.proxy.image.version | default .Values.linkerdVersion }}
imagePullPolicy: {{.Values.proxy.image.pullPolicy | default .Values.imagePullPolicy}}
resources:
  limits:
    cpu: "50m"
    memory: "10Mi"
  requests:
    cpu: "50m"
    memory: "10Mi"
securityContext:
  allowPrivilegeEscalation: false
  capabilities:
    drop:
    - ALL
  runAsNonRoot: true
  runAsUser: 65534
  seccompProfile:
    type: RuntimeDefault
command:
  - /usr/lib/linkerd/linkerd2-network-validator
args:
  - --log-format
  - {{ .Values.networkValidator.logFormat }}
  - --log-level
  - {{ .Values.networkValidator.logLevel }}
  - --connect-addr
  - {{ .Values.networkValidator.connectAddr }}
  - --listen-addr
  - {{ .Values.networkValidator.listenAddr }}
  - --timeout
  - {{ .Values.networkValidator.timeout }}

{{- end -}}
