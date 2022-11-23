hostname {{ .ShortName }}
username admin privilege 15 secret admin
username admin ssh-key ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD0/mROO/8Bx4MKMCyCn9G9MQAC5WxDFexpuh1vJ7p9tAH+ND7LjWhs1uq3MtTw0S2NVdLa3v+wSmLKF2+f0im/YgvpXMbSmiNHYRoSJ2O+0blbAWLN6wnre0EIA1/B1AmvY+/YIkFtfSSxsj/5UisvnN55Tdi/hk/vlOdkRfEd9uF3wF/ACW68D/Q4fBAhjbVidpDrDIvE3eQNJ9lGpxjkb+SJOWRSW8vwYahHdlJKsIdIa7nGJL+phPFDIjaJSxx9LFOxF9UySULdyruHvkrS2zKY9xx0EH1WIPiYSt61x8KVLsNNudS3CihFj4jqgxsQuSwj/SfrydvIgY65t/hXd9K9UYFRJRiBYyw8/xf72Vm0gfIE6fPO1Z1EFNHWM/QAzw1VfNYjONbN6C24miUlTq8inCXBhxmcSQed0atx60W4bieuP/sNfinscsc45HpejuoW/xvBrGCowqYypbDkaKB4GKBT5Img+u/1UHVI2J3ZcreHA8NMbzIS7Asr0Nk= coder@ubuntu
!
service routing protocols model multi-agent
!
aaa authorization exec default local
!
vrf instance MGMT
!
interface Management0
   description oob_management
   vrf MGMT
{{ if .MgmtIPv4Address }}   ip address {{ .MgmtIPv4Address }}/{{ .MgmtIPv4PrefixLength }}{{end}}
{{ if .MgmtIPv6Address }}   ipv6 address {{ .MgmtIPv6Address }}/{{ .MgmtIPv6PrefixLength }}{{end}}
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf MGMT
      no shutdown
!
end