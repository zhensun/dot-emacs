(defun zs/assign-servicenow-id (servicenow_number)
  (interactive "sEnter ServiceNow Number: ")
  (zs/assign-servicenow-property servicenow_number)
  (zs/assign-itr-tag))

(defun zs/assign-servicenow-property (servicenow_number)
  (org-entry-put (point) "ServiceNow_Number" servicenow_number))

(defun zs/assign-itr-tag ()
  (org-toggle-tag "ITR" 'on))

(defun zs/org-open-servicenow-page()
  (interactive)
  (zs/search-servicenow (org-entry-get (point) "ServiceNow_Number")))

(defun zs/search-servicenow-at-point ()
  (interactive)
  (zs/search-servicenow(thing-at-point 'word)))

(defun zs/search-servicenow (servicenow_number)
  "Multiply NUMBER by seven."
  (browse-url (concat "https://hfhs.service-now.com/hfhsess/search_results.do?sysparm_search="  servicenow_number)))

(provide 'servicenow-util)
